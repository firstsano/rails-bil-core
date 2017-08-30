class Utm::Discount < Sequel::Model(RCore::SequelDb.utm_db[:discount_transactions_all])
  include WithinRange

  within_range_attribute :discount_date

  many_to_one :service_data, foreign_key: :service_id, class_name: 'ServiceData'

  # scope :by_user_account, -> account { where(account_id: account.id) }
end
