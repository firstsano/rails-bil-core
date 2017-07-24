class Payment < VolgaspotRecord
  include SafeAttributes::Base

  self.table_name = "payment_transactions"
end
