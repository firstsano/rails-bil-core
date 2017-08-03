require 'rails_helper'

RSpec.describe User, type: :model do
  before { User.remote_data_service = double("RemoteDataService") }

  let(:data_service) { User.remote_data_service }
  let(:user_response) { attributes_for :user }

  def mock_data_service(method:, output: {})
    allow(data_service).to receive(method).and_return(output)
  end

  describe "instance methods" do
    let(:user) { build :user }
    subject { user }

    context "#authenticate" do
      let(:user) { User.new }
      before { mock_data_service method: :login, output: user_response }

      it { is_expected.to respond_to(:authenticate) }

      it "should return user with set attributes if login is succeds", aggregate_failures: true do
        password = Faker::Lorem.word
        expect(data_service).to receive(:login).with(hash_including(password: password))
        authenticated_user = user.authenticate password
        user_response.each { |attribute, value| expect(authenticated_user.send(attribute)).to eq value }
      end
    end

    context "#utm_account_id" do
      it { is_expected.to respond_to(:utm_account_id) }

      it "should send 'fetch_user_services' to remote_data_service" do
        expect(data_service).to receive(:fetch_user_utm_account).with(user.id)
        user.utm_account_id
      end
    end

    context "#service_ids" do
      it { is_expected.to respond_to(:service_ids) }

      it "should send 'fetch_user_services' to remote_data_service" do
        expect(data_service).to receive(:fetch_user_services).with(user.id)
        user.service_ids
      end
    end
  end

  describe "class methods" do
    subject { User }

    context "::find" do
      it { is_expected.to respond_to(:find) }

      it "should send 'fetch_user_data' to remote_data_service" do
        mock_data_service method: :fetch_user_data, output: user_response
        expect(data_service).to receive(:fetch_user_data).with(1)
        User.find 1
      end
    end

    context "::from_token_request" do
      let(:login) { Faker::Lorem.word }

      def request(request_params = {})
        Struct.new(:params).new(request_params)
      end

      it { is_expected.to respond_to(:from_token_request) }

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
