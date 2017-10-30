require 'rails_helper'

RSpec.describe V1::UsersController, type: :request do
  setup_auth

  describe "GET show" do
    let(:route) { "/users/show" }
    before { get route, headers: auth_headers }

    it "should return success" do
      expect(response).to have_http_status(:ok)
    end

    it "should return specific user attributes" do
      pattern = {
        login: String,
        email: String,
        balance: wildcard_matcher,
        "fullName" => String,
        "actualAddress" => String,
        "mobilePhone" => String,
        "internetStatus" => wildcard_matcher,
        "accountId" => wildcard_matcher
      }
      expect(response.body).to match_json_expression pattern
    end
  end
end
