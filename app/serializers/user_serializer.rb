class UserSerializer < ActiveModel::Serializer
  attributes :id, :login, :full_name, :actual_address, :mobile_phone, :email, :account_id

  def account_id
    object.vist_account
  end
end
