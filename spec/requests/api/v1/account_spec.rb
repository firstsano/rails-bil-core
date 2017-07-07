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
        10.times { create :discount, account_id: @user.account_id }
        get "/api/v1/account/discounts", headers: headers.merge(auth_headers)
      end

      it "should return ok header on success" do
        expect(response).to have_http_status(:ok)
      end

      it "should return corresponding data in response" do
        expect(json).not_to be_empty
      end
    end
  end
end
