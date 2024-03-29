require_relative '../requests_helper'

RSpec.describe V1::DiscountsController, type: :request do
  setup_auth

  describe "GET discounts" do
    before(:all) { Timecop.freeze }
    let(:route) { "/discounts/index" }

    context "discounts requested with filter" do
      def discount_range
        ((Date.today - 1.month)..Date.today).to_a
      end

      let(:from) { discount_range[5] }
      let(:to) { discount_range[10] }

      before do
        other_discounts = create_list(:discount, 30)
        discount_range.map(&:to_time).map(&:to_i).each { |d| create :discount, account_id: @user.utm_account_id, discount_date: d }
        get route, params: { include: "service-data", filter: { from: from, to: to } }, headers: auth_headers
      end

      it_behaves_like 'basic json API response',
        should_have_items: 5,
        with_relationships: "serviceData",
        required_attributes: ["incomingRest", "outgoingRest", "discount", "discountWithTax", "discountDate"]
      it_behaves_like 'json API response with included',
        type: "serviceData",
        required_attributes: ["description"]
    end

    after(:all) { Timecop.return }
  end
end
