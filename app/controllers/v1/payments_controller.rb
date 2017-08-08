class V1::PaymentsController < V1::BaseController
  before_action :prepare_date_range

  def index
    @payments = Utm::Payment
      .includes(:payment_method)
      .within_range(@date_range)
      .by_user_account current_user.utm_account
    render @payments
  end
end
