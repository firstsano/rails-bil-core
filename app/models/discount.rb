class Discount < VolgaspotRecord
  self.table_name = "discount_transactions_all"

  def readonly?
    true
  end
end
