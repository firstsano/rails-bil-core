class Utm::DiscountSerializer < ActiveModel::Serializer
  type :discounts

  attributes :id, :incoming_rest, :outgoing_rest, :discount, :discount_with_tax, :discount_date

  has_one :service

  class Utm::ServiceSerializer < ActiveModel::Serializer
    type :services

    attributes :id, :name, :service_type

    def service_type
      object.service_type_name
    end
  end
end
