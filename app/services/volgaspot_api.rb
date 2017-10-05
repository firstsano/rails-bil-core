module VolgaspotApi
  def self.login(login:, password:)
    Requests::Login.new(login: login, password: password).call
  end

  def self.fetch_user_data(id)
    Requests::UserInfo.new(user_id: id).call
  end

  def self.fetch_user_utm_account(id)
    Requests::UtmAccount.new(user_id: id).call
  end

  def self.fetch_user_services(id)
    Requests::Services.new(user_id: id).call
  end

  def self.fetch_user_available_tariffs(id)
    Requests::AvailableTariffs.new(user_id: id).call
  end

  def self.fetch_user_promised_payment_status(id)
    Requests::PromisedPaymentStatus.new(user_id: id).call
  end

  def self.use_promised_payment(user_id)
    Requests::UsePromisedPayment.new(user_id: id).call
  end
end
