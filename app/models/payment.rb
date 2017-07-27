class Payment < VolgaspotRecord
  include SafeAttributes::Base

  self.table_name = "payment_transactions"

  has_one :payment_method, primary_key: "method", foreign_key: "id"
end
