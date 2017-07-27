class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :payment_incurrency

  has_one :payment_method
end
