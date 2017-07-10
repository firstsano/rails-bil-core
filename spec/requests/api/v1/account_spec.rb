require 'rails_helper'

RSpec.describe Api::V1::AccountController, type: :request do
  let(:namespace) { "api/v1" }
  let(:headers) { { "HTTP_ACCEPT" => "application/json" } }

  describe "GET discounts" do
    let(:route) { namespace + "/account/discounts" }
    before { get "/api/v1/account/discounts" }

    context "when user is not authorized" do
      it "should return not_authorized header" do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when user is authorized" do
      sign_in
      before do
        5.times { create :discount, account_id: @user.account_id }
        5.times { create :discount }
        get "/api/v1/account/discounts", headers: headers.merge(auth_headers)
      end

      it "should return corresponding data in response", aggregate_failures: true do
        expect(response).to have_http_status(:ok)
        expect(json).not_to be_empty
        expect(json).to have(5).items
      end
    end
  end
end
