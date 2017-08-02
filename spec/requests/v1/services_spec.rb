require 'rails_helper'

RSpec.describe V1::ServicesController, type: :request do
  before { User.remote_data_service = VolgaspotApi }
  setup_auth

  describe "GET /services/index" do
    let(:route) { "/services/index" }
    let(:periodic_service_types) { [1, 2] }
    let(:periodic_service_type) { periodic_service_types.sample }

    clean_before(:each) do
      create_list :service, 10
      create_list :service, 5, :with_periodic_service_data, service_type: periodic_service_type
      stub_const("Utm::Service::PERIODIC_SERVICE_TYPES", periodic_service_types)
      get route, headers: auth_headers
    end

    it_behaves_like 'basic json API response',
      should_have_items: 5,
      required_attributes: ["name", "service-type", "description", "cost-month", "cost-day"]
  end
end
