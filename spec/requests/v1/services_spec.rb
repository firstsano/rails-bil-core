require 'rails_helper'

RSpec.describe V1::ServicesController, type: :request do
  before { User.remote_data_service = VolgaspotApiService }
  setup_auth

  describe "GET /services/index" do
    let(:route) { "/services/index" }
    clean_before(:all) do
      create_list :service, 5
    end

    before { get route, headers: auth_headers }

    it_behaves_like 'basic json API response'
  end
end
