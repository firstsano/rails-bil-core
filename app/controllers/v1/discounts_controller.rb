class V1::DiscountsController < V1::BaseController
  before_action :get_date_interval

  def index
    @discounts = Utm::Discount
      .includes(:service)
      .date_interval(from: @from, to: @to)
      .by_user_account current_user.utm_account
    render @discounts
  end

  private

  def get_date_interval
    @from, @to = filter_params :from, :to
    @from = @from.try(:to_datetime) || DateTime.now.beginning_of_month
    @to = @to.try(:to_datetime) || DateTime.now.beginning_of_day
  end
end
