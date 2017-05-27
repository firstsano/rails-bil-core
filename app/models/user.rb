class User < ActiveResource::Base
  self.site = ENV["volgaspot_api"]

  def authenticate(password)
    self.password = password
    response = parse_response self.class.post(:login)
    return false unless response[:success]
    load response[:data]
    self
  end

  private

  def parse_response(response)
    JSON.parse(response.body).with_indifferent_access
  end
end
