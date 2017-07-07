class Api::V1::AccountController < Api::V1::BaseController
  def discounts
    @discounts = Discount.by_user_account current_user
    render json: @discounts
  end
end
