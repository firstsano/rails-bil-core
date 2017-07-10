class DiscountSerializer < ActiveModel::Serializer
  attributes :id, :incoming_rest, :outgoing_rest, :discount, :discount_with_tax, :discount_date
end
