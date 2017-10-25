module Requests
  module HeadersHelpers
    def accept_json_headers
      { "HTTP_ACCEPT" => "application/json" }
    end
  end
end
