require 'rails_helper'

RSpec.describe Api::V1::AccountController, type: :request do
  let(:namespace) { "api/v1" }
  let(:headers) { { "HTTP_ACCEPT" => "application/json" } }

  describe "GET discounts" do
    let(:route) { namespace + "/account/discounts" }
    before { get "/api/v1/account/discounts" }

    context "when user is not authorized" do
      it "should return not_authorized header" do
        expect(response).to have_http_status(:not_authorized)
      end
    end

    it "should return ok header on success" do
      expect(response).to have_http_status(:ok)
    end

    it "should return corresponding data in response" do
      expect(json).not_to be_empty
    end
  end
end
