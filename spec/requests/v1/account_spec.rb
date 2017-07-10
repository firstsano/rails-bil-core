require 'rails_helper'

RSpec.describe V1::AccountController, type: :request do
  describe "GET discounts" do
    let(:route) { "/account/discounts" }
    before { get route }

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
        get route, headers: json_headers.merge(auth_headers)
      end

      it "should return corresponding data in response", aggregate_failures: true do
        expect(response).to have_http_status(:ok)
        expect(json).not_to be_empty
        expect(json["data"]).to have(5).items
      end
    end
  end
end
