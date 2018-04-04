module VolgaspotApi
  module Requests
    class LinkTariff < BaseRequest
      self.raw_route = "/users/:user_id/link-tariff-now"

      def initialize(user_id:, tariff_id:)
        super
      end

      def send_request
        @response = self.class.post route(@request_params)
      end

      def parse_response
        @response[:data][:tariff_id]
      end
    end
  end
end