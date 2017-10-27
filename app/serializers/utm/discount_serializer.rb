module Utm
  class DiscountSerializer < ::ActiveModel::Serializer
    attributes :id, :incoming_rest, :outgoing_rest, :discount, :discount_with_tax, :discount_date

    belongs_to :service_data
  end
end
