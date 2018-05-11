module VolgaspotApi
  module Requests
    class LinkTariff < BaseRequest
      self.raw_route = "/users/:user_id/link-tariff"

      def initialize(user_id:, tariff_id:)
        super
      end

      def send_request
        @response = self.class.put route(@request_params), body: @request_params
      end

      def parse_response
        @response[:success]
      end
    end
  end
end