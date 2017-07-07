class Discount < VolgaspotRecord
  self.table_name = "discount_transactions_all"

  scope :by_user_account, -> user { where(account_id: user.account_id) }

  def readonly?
    true
  end
end
