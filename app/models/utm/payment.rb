class Utm::Payment < Utm::VolgaspotRecord
  include SafeAttributes::Base
  include WithinRange

  self.table_name = "payment_transactions"
  within_range_attribute :payment_enter_date

  has_one :payment_method, primary_key: "method", foreign_key: "id"

  scope :by_user_account, -> account { where(account_id: account.id) }
end
