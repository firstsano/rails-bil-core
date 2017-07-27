require 'rails_helper'

RSpec.describe V1::PaymentsController, type: :request do
  before { User.remote_data_service = VolgaspotApiService }
  setup_auth

  describe "GET payments" do
    before(:all) { Timecop.freeze }
    let(:route) { "/payments/index" }

    context "payments requested with filter" do
      clean_before(:all) do
        # need to do some magic due to safe attributes
        # and 'save' InvalidArgument error
        create_list :payment, 20
        create_list :payment, 20, account_id: @user.utm_account
        payment_method = create :payment_method
        Payment.update_all method: payment_method.id
      end
      before { get route, params: { include: "payment-method" }, headers: auth_headers }

      it_behaves_like 'basic json API response',
        should_have_items: 20,
        required_attributes: ["payment-incurrency"]
      it_behaves_like 'json API response with included', "payment-methods"
      it_behaves_like 'json API response with relationships', "payment-method"
    end

    after(:all) { Timecop.return }
  end
end
