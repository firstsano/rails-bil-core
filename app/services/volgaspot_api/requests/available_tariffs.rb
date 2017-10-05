module VolgaspotApi
  module Requests
    class AvailableTariffs < BaseRequest
      self.raw_route = "/users/:user_id/available-tariffs"

      def initialize(user_id:)
        super
      end

      def parse_response
        @response[:data].keys
      end
    end
  end
end
