module V1
  class PromisedPaymentsController < BaseController
    def show
      @promised_payment_status = {status: "available"}
      render @promised_payment_status
    end

    def use
      render false
    end
  end
end
