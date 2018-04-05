module VolgaspotApi
  module Requests
    class LinkTariff < BaseRequest
      self.raw_route = "/users/:user_id/link-tariff"

      def initialize(user_id:, tariff_id:)
        super
      end

      def parse_response
        @response[:success]
      end
    end
  end
end