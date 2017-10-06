module V1
  class PromisedPaymentsController < BaseController
    def show
      render current_user.promised_payment_status
    end

    def use
      render current_user.use_promised_payment
    end
  end
end
