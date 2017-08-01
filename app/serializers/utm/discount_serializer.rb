class Utm::DiscountSerializer < ActiveModel::Serializer
  type :discounts

  attributes :id, :incoming_rest, :outgoing_rest, :discount, :discount_with_tax, :discount_date

  has_one :service
end
