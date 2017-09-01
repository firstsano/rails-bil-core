class Utm::Discount < Sequel::Model(RCore::SequelDb.utm_db[:discount_transactions_all])
  include WithinRange
  include ReadOnlyRecords

  within_range_attribute :discount_date

  many_to_one :service_data, key: :service_id, class: Utm::ServiceData

  # scope :by_user_account, -> account { where(account_id: account.id) }
end
