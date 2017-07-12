module Requests
  module HeadersHelpers
    def json_headers
      { "HTTP_ACCEPT" => "application/json" }
    end
  end

  module JsonHelpers
    def json_response
      JSON.parse(response.body)
    end
  end
end
