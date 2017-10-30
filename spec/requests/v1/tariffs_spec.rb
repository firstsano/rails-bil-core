require_relative '../requests_helper'

RSpec.describe V1::TariffsController, type: :request do
  setup_auth

  describe "GET /tariffs/index" do
    let(:route) { "/tariffs/index" }

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
end
