class Utm::Payment < Sequel::Model(RCore::SequelDb.utm_db[:payment_transactions])
  include WithinRange
  include ReadOnlyRecords

  within_range_attribute :payment_enter_date

  many_to_one :payment_method, key: :method, primary_key: :id, class: Utm::PaymentMethod

  # scope :by_user_account, -> account { where(account_id: account.id) }
end
