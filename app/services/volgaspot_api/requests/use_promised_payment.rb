module VolgaspotApi
  module Requests
    class UsePromisedPayment < BaseRequest
      self.raw_route = "/users/:user_id/use-promised-payment"

      def initialize(user_id:)
        super
      end

      def send_request
        @response = self.class.put route(@request_params)
      end
    end
  end
end
