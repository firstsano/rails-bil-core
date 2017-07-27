class Payment < VolgaspotRecord
  include SafeAttributes::Base

  self.table_name = "payment_transactions"

  has_one :payment_method, primary_key: "method", foreign_key: "id"

  scope :by_user_account, -> account { where(account_id: account.id) }
end
