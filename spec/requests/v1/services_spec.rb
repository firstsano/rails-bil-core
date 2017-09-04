require 'rails_helper'

RSpec.describe V1::ServicesController, type: :request do
  setup_auth

  describe "GET /services/index" do
    let(:route) { "/services/index" }

    before do
      create_list :periodic_service, 5
      @user_services = create_list :periodic_service, 5
      user_service_ids = @user_services.map(&:id)
      allow(@user).to receive(:service_ids).and_return user_service_ids
      get route, headers: auth_headers
    end

    it_behaves_like 'basic json API response',
      should_have_items: 5,
      required_attributes: ["name", "type-of-service", "description", "cost-month", "cost-day"]
  end
end
