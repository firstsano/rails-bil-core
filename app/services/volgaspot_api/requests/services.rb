module VolgaspotApi
  module Requests
    class Services < BaseRequest
      self.raw_route = "/users/:user_id?expand=services"

      def initialize(user_id:)
        super
      end

      def parse_response
        @response[:data][:services]
          .values
          .index_by { |service| service[:service_id] }
          .keys
      end
    end
  end
end
