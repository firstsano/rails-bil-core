class V1::PaymentsController < V1::BaseController
  def index
    render Payment.by_user_account(current_user.utm_account)
  end
end
