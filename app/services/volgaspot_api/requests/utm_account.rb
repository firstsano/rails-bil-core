module VolgaspotApi
  module Requests
    class UtmAccount < BaseRequest
      self.raw_route = "/users/:user_id?expand=account"

      def initialize(user_id:)
        super
      end

      def parse_response
        @response[:data][:account][:id]
      end
    end
  end
end
