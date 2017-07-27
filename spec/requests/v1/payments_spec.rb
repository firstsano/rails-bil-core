require 'rails_helper'

RSpec.describe V1::PaymentsController, type: :request do
  before { User.remote_data_service = VolgaspotApiService }
  setup_auth

  describe "GET payments" do
    before(:all) { Timecop.freeze }
    let(:route) { "/payments/index" }

    context "payments requested with filter" do
      def discount_range
        ((Date.today - 1.month)..Date.today).to_a
      end

      let(:from) { discount_range[5] }
      let(:to) { discount_range[10] }

      clean_before(:all) do
        # need to do some magic due to safe attributes
        # and 'save' InvalidArgument error
        create_list :payment, 20
        discount_range.map(&:to_time).map(&:to_i).each { |d| create :payment, account_id: @user.utm_account, payment_enter_date: d }
        payment_method = create :payment_method
        Payment.update_all method: payment_method.id
      end
      before { get route, params: { include: "payment-method", filter: { from: from, to: to } }, headers: auth_headers }

      it_behaves_like 'basic json API response',
        should_have_items: 5,
        required_attributes: ["payment-incurrency"]
      it_behaves_like 'json API response with included', "payment-methods"
      it_behaves_like 'json API response with relationships', "payment-method"
    end

    after(:all) { Timecop.return }
  end
end
