class User
  class_attribute :auth_service
  self.auth_service = VolgaspotApiService

  attr_accessor :id, :login, :full_name, :actual_address, :status,
    :mobile_phone, :email, :account_id

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

  def self.find(user_id)
    user_attributes = auth_service.fetch_resource resource_name: :user, resource_id: user_id
    user = self.new
    user_attributes.each do |attribute, value|
      user.send "#{attribute}=", value
    end
    user
  end
end
