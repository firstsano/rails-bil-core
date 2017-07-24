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
