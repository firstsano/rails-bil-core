require 'rails_helper'

RSpec.describe V1::AccountController, type: :request do
  before { User.remote_data_service = VolgaspotApiService }

  describe "GET discounts" do
    setup_auth
    before(:all) { Timecop.freeze }
    let(:route) { "/account/discounts" }

    context "discounts requested with filter" do
      def discount_range
        ((Date.today - 1.month)..Date.today).to_a
      end

      let(:from) { discount_range[5] }
      let(:to) { discount_range[10] }

      clean_before(:all) do
        other_discounts = create_list(:discount, 30)
        discount_range.map(&:to_time).map(&:to_i).each { |d| create :discount, account_id: @user.utm_account, discount_date: d }
      end
      before { get route, params: { include: :service, filter: { from: from, to: to } }, headers: auth_headers }

      it_behaves_like 'basic json API response',
        should_have_items: 5,
        required_attributes: ["incoming-rest", "outgoing-rest", "discount", "discount-with-tax", "discount-date"]
      it_behaves_like 'json API response with relationships', "service"
      it_behaves_like 'json API response with included', "services"
    end

    after(:all) { Timecop.return }
  end
end
