require 'rails_helper'

RSpec.describe "User", type: :model do
  describe "using ActiveResource as user model" do
    let(:json_headers) { {"Content-Type"=>"application/json"} }

    def target_url(postfix)
      ENV["volgaspot_api_prefix"] + postfix
    end

    it "should inherit from ActiveResource class" do
      expect(User).to be <  ActiveResource::Base
    end

    describe "instance methods" do
      context "#authenticate" do
        let(:user_attributes) { {id: 1, name: "John Doe", email: "john@mail.com"} }
        let(:user_password) { "test_password" }
        let(:current_user) { User.new }

        def mock_response(output = {})
          ActiveResource::HttpMock.respond_to do |mock|
            mock.post target_url("/users/login.json"), json_headers, output.to_json
          end
        end

        it "should respond to a method with password param" do
          expect(current_user).to respond_to(:authenticate).with(1).arguments
        end

        it "should return user if remote server has one with valid credentials" do
          mock_response({success: true, data: user_attributes})
          authenticated_user = current_user.authenticate(user_password)
          expect(authenticated_user).to be_truthy
          expect(authenticated_user.id).to eq(1)
        end

        it "should return false if no user found on remote server with given credentials" do
          mock_response({})
          expect(current_user.authenticate(user_password)).to be false
        end
      end
    end
  end
end
