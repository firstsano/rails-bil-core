require "rails_helper"

RSpec.describe V1::PromisedPaymentsController, type: :request do
  setup_auth

  describe "GET /promised-payments/show" do
    let(:route) { "/promised-payments/show" }

    before do
      allow(@user).to receive(:promised_payment_status).and_return({ available: true })
      get route, headers: auth_headers
    end

    it_behaves_like 'basic json API response'
  end

  describe "PUT /promised-payments/use" do
    let(:route) { "/promised-payments/use" }

    before do
      allow(@user).to receive(:use_promised_payment).and_return(true)
      put route, headers: auth_headers
    end

    it_behaves_like 'basic json API response'
  end
end
