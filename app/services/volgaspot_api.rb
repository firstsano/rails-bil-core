module VolgaspotApi
  def self.login(login:, password:)
    VolgaspotApi::Requests::Login.new(login: login, password: password).call
  end

  def self.fetch_user_data(id)
    VolgaspotApi::Requests::UserInfo.new(user_id: id).call
  end

  def self.fetch_user_utm_account(id)
    VolgaspotApi::Requests::UtmAccount.new(user_id: id).call
  end

  def self.fetch_user_services(id)
    VolgaspotApi::Requests::Services.new(user_id: id).call
  end

  def self.fetch_user_available_tariffs(id)
    VolgaspotApi::Requests::AvailableTariffs.new(user_id: id).call
  end

  def self.fetch_user_promised_payment_status(id)
    VolgaspotApi::Requests::PromisedPaymentStatus.new(user_id: id).call
  end

  def self.use_promised_payment(id)
    VolgaspotApi::Requests::UsePromisedPayment.new(user_id: id).call
  end
end
