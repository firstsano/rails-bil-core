class UserSerializer < BaseSerializer
  attributes :id, :login, :full_name, :actual_address, :mobile_phone, :email

  attribute :account_id { object.vist_account_id }
  attribute :balance { object.utm_account.balance }
  attribute :internet_status { object.utm_account.internet_status }
end
