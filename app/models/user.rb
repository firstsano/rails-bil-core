class User
  include ActiveModel::Model

  class_attribute :remote_data_service
  self.remote_data_service = VolgaspotApiService

  attr_accessor :id, :login, :full_name, :actual_address, :status,
    :mobile_phone, :email, :vist_account, :utm_account

  def set_attributes(attributes)
    assign_attributes attributes.slice(*whitelist_params)
    self
  end

  def self.from_token_request(request)
    login = request.params["auth"] && request.params["auth"]["login"]
    raise_user_not_found unless login
    self.new login: login
  end

  def authenticate(password)
    user_data = self.class.remote_data_service.login(login: login, password: password)
    return false unless user_data
    set_attributes user_data
  end

  def self.find(user_id)
    user_attributes = remote_data_service.fetch_user_data user_id
    raise_user_not_found unless user_attributes
    self.new.set_attributes user_attributes
  end

  private

  def self.raise_user_not_found
    raise ActiveRecord::RecordNotFound
  end

  def whitelist_params
    [:id, :login, :full_name, :actual_address, :status,
      :mobile_phone, :email, :vist_account, :utm_account]
  end
end
