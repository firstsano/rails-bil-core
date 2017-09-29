module Utm
  class ServiceData < ::Sequel::Model(RCore::SequelDb.utm_db[:services_data])
    include ReadOnlyRecords

    one_to_one :parent, key: :parent_service_id, class: Utm::ServiceData

    alias_attribute :name, :service_name
    alias_attribute :description, :comment

    def type_of_service
      parent&.name
    end
  end
end
