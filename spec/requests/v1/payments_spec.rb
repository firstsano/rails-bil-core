require 'rails_helper'

RSpec.describe V1::PaymentsController, type: :request do
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

      before do
        payment_method = create :payment_method
        create_list :payment, 20
        discount_range.map(&:to_time).map(&:to_i).each do |date|
          create :payment, account_id: @user.utm_account_id,
            payment_enter_date: date, payment_method_id: payment_method.id
        end
        get route, params: { include: "payment-method", filter: { from: from, to: to } }, headers: auth_headers
      end

      it_behaves_like 'basic json API response',
        should_have_items: 5,
        required_attributes: ["payment-incurrency"]
      it_behaves_like 'json API response with included', "payment-methods"
      it_behaves_like 'json API response with relationships', "payment-method"
    end

    after(:all) { Timecop.return }
  end
end
