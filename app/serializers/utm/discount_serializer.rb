class Utm::DiscountSerializer < BaseSerializer
  attributes :id, :incoming_rest, :outgoing_rest, :discount, :discount_with_tax, :discount_date

  has_one :service_data

  class Utm::ServiceDataSerializer < BaseSerializer
    def type
      'service-datum'
    end

    attributes :id, :name, :type_of_service, :description
  end
end
