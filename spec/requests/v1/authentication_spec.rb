require 'rails_helper'

RSpec.describe V1::BaseController, type: :request do
  before { User.remote_data_service = VolgaspotApi }

  describe "authorization" do
    setup_auth
    let(:route) { "/discounts/index" }

    context "when user is not authorized" do
      it "should return not_authorized status" do
        get route, headers: json_headers
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when user is authorized through token" do
      it "should return resource with ok status" do
        get route, headers: auth_headers
        expect(response).to have_http_status(:ok)
        expect(json_body).not_to be_empty
      end
    end
  end
end
