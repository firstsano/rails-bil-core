class Utm::PaymentSerializer < BaseSerializer
  attributes :id, :payment_incurrency

  has_one :payment_method
end
