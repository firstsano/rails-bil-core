require 'rails_helper'

RSpec.describe V1::TariffsController, type: :request do
  setup_auth

  describe "GET /tariffs/index" do
    let(:route) { "/tariffs/index" }

    before do
      create_list :tariff, 5
      get route, headers: auth_headers
    end

    it_behaves_like 'basic json API response',
      should_have_items: 5,
      required_attributes: ["name", "comments"]
  end
end
