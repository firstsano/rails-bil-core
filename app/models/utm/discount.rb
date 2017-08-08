class Utm::Discount < Utm::VolgaspotRecord
  self.table_name = "discount_transactions_all"

  belongs_to :service_data, foreign_key: :service_id, class_name: 'ServiceData'

  scope :by_user_account, -> account { where(account_id: account.id) }

  def self.date_interval(from: nil, to: nil)
    scoped = self
    scoped = from ? scoped.where.has { discount_date >= from.to_i } : scoped
    scoped = to ? scoped.where.has { discount_date <= to.to_i } : scoped
  end
end