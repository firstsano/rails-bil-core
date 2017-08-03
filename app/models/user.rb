class User
  include ActiveModel::Model
  include ActiveModel::Serialization
  include WhitelistAttributes

  class_attribute :remote_data_service
  self.remote_data_service = VolgaspotApi

  attr_accessor :id, :login, :full_name, :actual_address, :status,
    :mobile_phone, :email, :vist_account_id

  def self.from_token_request(request)
    login = request.params["auth"] && request.params["auth"]["login"]
    raise_user_not_found unless login
    self.new login: login
  end

  def authenticate(password)
    user_data = remote_data_service.login(login: login, password: password)
    set_attributes user_data
  end

  def self.find(user_id)
    self.new remote_data_service.fetch_user_data(user_id)
  end

  def utm_account_id
    @utm_account_id ||= remote_data_service.fetch_user_utm_account id
  end

  def utm_account
    @utm_account ||= Utm::Account.find utm_account_id
  end

  def service_ids
    @service_ids ||= remote_data_service.fetch_user_services id
  end

  private

  def self.raise_user_not_found
    raise ActiveRecord::RecordNotFound
  end

  def whitelist_params
    [:id, :login, :full_name, :actual_address, :status,
      :mobile_phone, :email, :vist_account_id]
  end
end
