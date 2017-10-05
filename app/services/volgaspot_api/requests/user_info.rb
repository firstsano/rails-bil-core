module VolgaspotApi
  module Requests
    class UserInfo < BaseRequest
      self.raw_route = "/users/:user_id"

      def initialize(user_id:)
        super
      end

      def parse_response
        @response[:data][:vist_account] = @response[:data][:account_id]
        @response[:data]
      end
    end
  end
end
