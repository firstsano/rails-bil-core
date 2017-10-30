module Utm
  class PaymentSerializer <  ::ActiveModel::Serializer
    attributes :id, :payment_incurrency

    belongs_to :payment_method
  end
end
