module Utm
  class PaymentMethod < ::Sequel::Model(RCore::SequelDb.utm_db[:payment_methods])
    include ReadOnlyRecords
    include ::ActiveModel::Serialization
  end
end
