require 'rails_helper'

RSpec.describe "User", type: :model do
  describe "using ActiveResource as user model" do
    it "should inherit from ActiveResource class" do
      expect(User).to be <  ActiveResource::Base
    end

    describe "instance methods" do
      context "#authenticate" do
        let(:user_attributes) { {name: "John Doe", login: "riky"} }
        let(:db_user_attributes) { user_attributes.merge({id: 1}) }
        let(:user_password) { "test_password" }
        let(:current_user) { User.new(user_attributes) }

        def mock_service(output: {})
          allow(VolgaspotApiService).to receive(:login).and_return(output)
        end

        it "should respond to a method with password param" do
          expect(current_user).to respond_to(:authenticate).with(1).arguments
        end

        it "should return user if remote server has one with valid credentials" do
          mock_service output: db_user_attributes
          authenticated_user = current_user.authenticate(user_password)
          expect(authenticated_user).to be_truthy
          expect(authenticated_user.id).to eq(1)
        end

        it "should return false if no user found on remote server with given credentials" do
          mock_service output: false
          expect(current_user.authenticate(user_password)).to be false
        end
      end
    end
  end
end
