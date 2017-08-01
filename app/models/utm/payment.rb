class Utm::Payment < Utm::VolgaspotRecord
  include SafeAttributes::Base

  self.table_name = "payment_transactions"

  has_one :payment_method, primary_key: "method", foreign_key: "id"

  scope :by_user_account, -> account { where(account_id: account.id) }

  def self.date_interval(from: nil, to: nil)
    scoped = self
    scoped = from ? scoped.where.has { payment_enter_date >= from.to_i } : scoped
    scoped = to ? scoped.where.has { payment_enter_date <= to.to_i } : scoped
  end
end
