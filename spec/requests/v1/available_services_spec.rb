require "rails_helper"

RSpec.describe V1::AvailableServicesController, type: :request do
  clean
  setup_auth

  describe "GET index" do
    let(:route) { "/available-services/index" }
    before { get route, headers: auth_headers }

    it_behaves_like 'basic json API response',
      should_have_items: 5,
      required_attributes: ["name", "type-of-service", "description", "speed", "cost-month", "cost-day", "is-active"]
  end
end
