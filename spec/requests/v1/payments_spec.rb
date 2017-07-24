require 'rails_helper'

RSpec.describe V1::PaymentsController, type: :request do
  before { User.remote_data_service = VolgaspotApiService }
  setup_auth

  describe "GET payments" do
    before(:all) { Timecop.freeze }
    let(:route) { "/payments/index" }

    context "payments requested with filter" do
      it_behaves_like 'basic json API response'
    end

    after(:all) { Timecop.return }
  end
end
