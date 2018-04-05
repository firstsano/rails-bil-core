module VolgaspotApi
  module Requests
    class UnlinkTariff < BaseRequest
      self.raw_route = "/users/:user_id/unlink-tariff"

      def initialize(user_id:)
        super
      end

      def parse_response
        @response[:success]
      end
    end
  end
end