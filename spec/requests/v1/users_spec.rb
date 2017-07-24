require 'rails_helper'

RSpec.describe V1::UsersController, type: :request do
  before { User.remote_data_service = VolgaspotApiService }
  setup_auth

  # describe "GET status" do
  #   let(:route) { "/users/show" }
  #   before { get route, headers: auth_headers }
  #
  #   it "should return success with data attribute", aggregate_failures: true do
  #     expect(response).to have_http_status(:ok)
  #     expect(response.body).to match_json_expression({ data: Object })
  #   end
  #
  #   it "should return specific account attributes" do
  #     pattern = {
  #       data: {
  #         attributes: {
  #           login: String,
  #           email: String,
  #           balance: wildcard_matcher,
  #           "account-id" => wildcard_matcher,
  #           "full-name" => String,
  #           "actual-address" => String,
  #           "mobile-phone" => String,
  #           "internet-status" => wildcard_matcher
  #         }
  #       }
  #     }
  #     expect(response.body).to match_json_expression pattern
  #   end
  # end
end
