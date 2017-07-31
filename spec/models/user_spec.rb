require 'rails_helper'

RSpec.describe User, type: :model do
  before { User.remote_data_service = double("RemoteDataService") }

  let(:data_service) { User.remote_data_service }
  let(:user_response) { attributes_for :user }

  def mock_data_service(method:, output: {})
    allow(data_service).to receive(method).and_return(output)
  end

  describe "instance methods" do
    context "#authenticate" do
      let(:user) { User.new }
      let(:password) { Faker::Lorem.word }
      before { mock_data_service method: :login, output: user_response }

      it "should respond to a method with password param" do
        expect(user).to respond_to(:authenticate).with(1).arguments
      end

      it "should return user with set attributes if login is succeds", aggregate_failures: true do
        expect(data_service).to receive(:login).with(hash_including(password: password))
        authenticated_user = user.authenticate password
        user_response.each { |attribute, value| expect(authenticated_user.send(attribute)).to eq value }
      end
    end

    context "#services" do
      let(:user) { build :user }
      subject { user }
      it { is_expected.to respond_to(:services) }
      it "should get Service instances"
    end
  end

  describe "class methods" do
    subject { User }

    context "::find" do
      it { is_expected.to respond_to(:find).with(1).arguments }

      it "should call 'fetch_user_data' method of remote_data_service" do
        mock_data_service method: :fetch_user_data, output: user_response
        expect(data_service).to receive(:fetch_user_data).with(1, instance_of(User))
        User.find 1
      end
    end

    context "::from_token_request" do
      let(:login) { Faker::Lorem.word }

      def request(request_params = {})
        Struct.new(:params).new(request_params)
      end

      it { is_expected.to respond_to(:from_token_request).with(1).arguments }

      it "raises error when login is not provided with the request" do
        expect { User.from_token_request(request) }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it "creates new user instance with login from request params", aggregate_failures: true do
        user = User.from_token_request request({ "auth" => { "login" => login } })
        expect(user).to be_an_instance_of User
        expect(user.login).to eq login
      end
    end
  end
end
