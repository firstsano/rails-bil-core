class User
  include ActiveModel::Model
  include ActiveModel::Serialization
  include WhitelistAttributes

  class_attribute :remote_data_service
  self.remote_data_service = VolgaspotApi

  attr_accessor :id, :login, :full_name, :actual_address, :status,
    :mobile_phone, :email, :vist_account, :utm_account

  def self.from_token_request(request)
    login = request.params["auth"] && request.params["auth"]["login"]
    raise_user_not_found unless login
    self.new login: login
  end

  def authenticate(password)
    user_data = self.class.remote_data_service.login(login: login, password: password)
    set_attributes user_data
  end

  def self.find(user_id)
    user = self.new(utm_account: Account.new)
    remote_data_service.fetch_user_data(user_id, user)
    user
  end

  def services
    @services ||= remote_data_service.load_user_services(id)
  end

  private

  def self.raise_user_not_found
    raise ActiveRecord::RecordNotFound
  end

  def whitelist_params
    [:id, :login, :full_name, :actual_address, :status,
      :mobile_phone, :email, :vist_account]
  end

  class Account
    include ActiveModel::Model
    include ActiveModel::Serialization
    include WhitelistAttributes

    attr_accessor :id, :balance, :credit, :int_status, :is_blocked

    alias_attribute :internet_status, :int_status

    private

    def whitelist_params
      [:id, :balance, :credit, :int_status, :is_blocked]
    end
  end
end
