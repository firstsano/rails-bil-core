class User < ActiveResource::Base
  self.site = ENV["volgaspot_api"]
  self.include_format_in_path = false

  class_attribute :auth_service
  self.auth_service = VolgaspotApiService

  schema do
    string 'login', 'full_name', 'actual_address', 'status', 'mobile_phone', 'email'
    integer 'account_id'
  end

  def self.from_token_request(request)
    login = request.params["auth"] && request.params["auth"]["login"]
    self.new login: login
  end

  def authenticate(password)
    user_data = self.class.auth_service.login(login: login, password: password)
    return false unless user_data
    load user_data
    self
  end
end
