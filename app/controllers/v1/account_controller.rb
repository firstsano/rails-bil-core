class V1::AccountController < V1::BaseController
  def discounts
    @discounts = Discount.by_user_account current_user
    render json: @discounts
  end
end
