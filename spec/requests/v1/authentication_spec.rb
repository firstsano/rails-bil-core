require_relative '../requests_helper'

RSpec.describe V1::BaseController, type: :request do
  describe "authorization" do
    setup_auth
    let(:route) { "/discounts/index" }

    context "when user is not authorized" do
      it "should return not_authorized status" do
        get route, headers: accept_json_headers
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when user is authorized through token" do
      it "should return resource with ok status" do
        get route, headers: auth_headers
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).not_to be_empty
      end
    end
  end
end
