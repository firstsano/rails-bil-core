module V1
  class DiscountsController < BaseController
    before_action :prepare_date_range

    def index
      @discounts = Utm::Discount
                   .within_range(@date_range)
                   .by_user_account(current_user.utm_account)
                   .all
      render @discounts
    end
  end
end
