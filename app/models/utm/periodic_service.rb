module Utm
  class PeriodicService < ::Sequel::Model(RCore::SequelDb.utm_db[:periodic_services_data])
    include ReadOnlyRecords

    many_to_many :tariffs, class: Utm::Tariff, join_table: "tariffs_services_link",
                           left_key: :tariff_id, right_key: :service_id

    alias_attribute :cost_month, :cost

    delegate :name, :description, :type_of_service, to: :service_data

    SERVICE_TYPES = [2, 5].freeze

    def service_data
      @service_data ||= Utm::ServiceData.where(service_type: SERVICE_TYPES)[id]
    end

    def cost_day
      days_in_month = Time.days_in_month(Date.current.month)
      (cost_month.to_f / days_in_month).round 2
    end
  end
end
