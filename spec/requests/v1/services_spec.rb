require 'rails_helper'

RSpec.describe V1::ServicesController, type: :request do
  before { User.remote_data_service = VolgaspotApi }
  setup_auth

  describe "GET /services/index" do
    let(:route) { "/services/index" }
    clean_before(:all) do
      create_list :service, 5
    end

    before do
      get route, headers: auth_headers
    end

    it_behaves_like 'basic json API response',
      should_have_items: 5,
      required_attributes: ["name", "service-type", "description", "cost-month", "cost-day"]
  end
end
