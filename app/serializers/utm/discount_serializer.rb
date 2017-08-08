class Utm::DiscountSerializer < ActiveModel::Serializer
  type :discounts

  attributes :id, :incoming_rest, :outgoing_rest, :discount, :discount_with_tax, :discount_date

  belongs_to :service_data

  class Utm::ServiceDataSerializer < ActiveModel::Serializer
    type :service_datum

    attributes :id, :name, :type_of_service, :description
  end
end
