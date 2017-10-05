module VolgaspotApi
  module Requests
    class Login < BaseRequest
      self.raw_route = "/customer-sessions/login"

      def initialize(login:, password:)
        super
      end

      def send_request
        @response = self.class.put(route, body: @request_params)
      end
    end
  end
end
