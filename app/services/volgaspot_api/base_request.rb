module VolgaspotApi
  class BaseRequest
    include HTTParty
    base_uri ENV["volgaspot_api"]

    class_attribute :raw_route

    def initialize(request_params = {})
      @request_params = request_params
    end

    def call
      send_request
      prepare_response
      parse_response
    end

    def send_request
      @response = self.class.get route(@request_params)
    end

    def parse_response
      @response[:data]
    end

    private

    def route(params = {})
      route_with_params = raw_route.clone
      params.each { |k, v| route_with_params.gsub! ":#{k}", v.to_s }
      route_with_params
    end

    def prepare_response
      @response = @response.parsed_response.with_indifferent_access
      raise(::Exceptions::RemoteRequestError, "Remote server couldn't execute request") unless @response[:success]
    end
  end
end
