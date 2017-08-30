class Utm::Payment < Sequel::Model(RCore::SequelDb.utm_db[:payment_transactions])
  include WithinRange

  within_range_attribute :payment_enter_date

  many_to_one :payment_method, primary_key: "method", foreign_key: "id"

  # scope :by_user_account, -> account { where(account_id: account.id) }
end
