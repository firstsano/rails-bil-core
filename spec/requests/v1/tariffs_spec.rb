require_relative '../requests_helper'

RSpec.describe V1::TariffsController, type: :request do
  setup_auth
  let(:route) { "/tariffs/index" }

  describe "GET /tariffs/index" do
    before do
      create_list :tariff, 5
      @user_services = create_list :periodic_service, 3, :with_tariff
      user_service_ids = @user_services.map(&:id)
      allow(@user).to receive(:service_ids).and_return user_service_ids
      get route, headers: auth_headers
    end

    it_behaves_like 'basic json API response',
      should_have_items: 3,
      required_attributes: ["name", "comments"]
  end

  describe "PUT /tariffs/index" do
    context "when tariff_id is not specified" do
      it "should raise parameter missing error" do
        expect { put route, headers: auth_headers }.to raise_error(ActionController::ParameterMissing)
      end
    end

    it "should return successful response" do
      allow(@user).to receive(:link_tariff).and_return true
      put route, headers: auth_headers, params: { tariff_id: Faker::Number.number(3) }
      expect(response).to have_http_status(:no_content)
    end
  end

  describe "DELETE /tariffs/index" do
    it "should return successful response" do
      allow(@user).to receive(:unlink_tariff).and_return true
      delete route, headers: auth_headers
      expect(response).to have_http_status(:no_content)
    end
  end
end