class Utm::PaymentMethodSerializer < ActiveModel::Serializer
  type :payment_methods

  attributes :id, :name
end
