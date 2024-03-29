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

  def self.link_user_tariff(user_id, tariff_id)
    VolgaspotApi::Requests::LinkTariff.new(user_id: user_id, tariff_id: tariff_id).call
  end

  def self.unlink_user_tariff(user_id)
    VolgaspotApi::Requests::UnlinkTariff.new(user_id: user_id).call
  end
end
