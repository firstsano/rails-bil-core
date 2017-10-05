module VolgaspotApi
  module Requests
    class PromisedPaymentStatus < BaseRequest
      self.raw_route = "/users/:user_id/promised-payment-status"

      def initialize(user_id:)
        super
      end
    end
  end
end
