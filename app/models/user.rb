class User < ActiveResource::Base
  self.site = ENV["volgaspot_api"]

  def self.from_token_request(request)
    email = request.params["auth"] && request.params["auth"]["email"]
    self.new email: email
  end

  def authenticate(password)
    self.password = password
    response = parse_response send_custom_request(request_type: :post, element: 'customer-session', action: :login)
    return false unless response[:success]
    load response[:data]
    self
  end

  private

  def send_custom_request(request_type:, action:, element: self.class.name.downcase)
    self.class.element_name = element
    response = self.class.send(request_type, action)
    self.class.element_name = "user"
    response
  end

  def parse_response(response)
    JSON.parse(response.body).with_indifferent_access
  end
end
