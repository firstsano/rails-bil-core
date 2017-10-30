class UserSerializer < ::ActiveModel::Serializer
  attributes :id, :login, :full_name, :actual_address, :mobile_phone, :email, :balance,
             :account_id, :internet_status

  def account_id
    object.vist_account_id
  end

  def balance
    object.utm_account.balance
  end

  def internet_status
    object.utm_account.internet_status
  end
end
