class Utm::PaymentSerializer < ActiveModel::Serializer
  type :payments

  attributes :id, :payment_incurrency

  has_one :payment_method
end
