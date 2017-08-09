class Utm::Discount < Utm::VolgaspotRecord
  include WithinRange

  self.table_name = "discount_transactions_all"
  within_range_attribute :discount_date

  belongs_to :service_data, foreign_key: :service_id, class_name: 'ServiceData'

  scope :by_user_account, -> account { where(account_id: account.id) }
end
