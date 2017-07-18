class V1::AccountController < V1::BaseController
  before_action :get_date_interval

  def discounts
    @discounts = Discount
      .includes(:service)
      .date_interval(from: @from, to: @to)
      .by_user_account current_user
    render @discounts
  end

  private

  def get_date_interval
    @from, @to = filter_params :from, :to
    @from = @from.try(:to_datetime) || DateTime.now.beginning_of_month
    @to = @to.try(:to_datetime) || DateTime.now.beginning_of_day
  end
end
