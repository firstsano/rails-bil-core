require 'rails_helper'

RSpec.describe V1::AccountController, type: :request do
  describe "GET discounts" do
    let(:route) { "/account/discounts" }
    let(:json_auth_headers) { json_headers.merge auth_headers }

    context "when user is not authorized" do
      it "should return not_authorized header" do
        get route
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when user is authorized" do
      clean_before
      sign_in

      context "resource requested without additional params" do
        clean_before { create_list(:discount, 5, :yesterday, account_id: @user.account_id) + create_list(:discount, 5) }
        before { get route, params: { include: :service }, headers: json_auth_headers }

        it_behaves_like 'basic json API response',
          should_have_items: 5,
          required_attributes: ["incoming-rest", "outgoing-rest", "discount", "discount-with-tax", "discount-date"]
        it_behaves_like 'json API response with relationships', "service"
        it_behaves_like 'json API response with included', "services"
      end

      context "resource requested with date interval" do
        clean_before(:all) do
          discount_range = ((DateTime.now - 1.month)..DateTime.now).to_a
          discount_range.map(&:to_i).each do |discount_date|
            create :discount, account_id: @user.account_id, discount_date: discount_date
          end
          @from = discount_range[5].to_date.to_s
          @to = discount_range[10].to_date.to_s
        end

        it "should return only discounts with date in interval", aggregate_failuires: true do
          get route, params: { filter: { from: @from, to: @to } }, headers: json_auth_headers
          expect(response.body).to have_json_size(5).at_path "data"
        end
      end
    end
  end
end
