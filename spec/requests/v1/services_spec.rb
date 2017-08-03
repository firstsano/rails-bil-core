require 'rails_helper'

RSpec.describe V1::ServicesController, type: :request do
  setup_auth

  describe "GET /services/index" do
    let(:route) { "/services/index" }
    let(:user_services) { create_list :service, 5, :with_periodic_service_data }

    clean_before(:all) do
      create_list :service, 10
      create_list :service, 5, :with_periodic_service_data
      @user_services = create_list :service, 5, :with_periodic_service_data
    end

    before(:each) do
      user_service_ids = @user_services.map(&:id)
      allow(@user).to receive(:service_ids).and_return user_service_ids
      get route, headers: auth_headers
    end

    it_behaves_like 'basic json API response',
      should_have_items: 5,
      required_attributes: ["name", "service-type", "description", "cost-month", "cost-day"]
  end
end
