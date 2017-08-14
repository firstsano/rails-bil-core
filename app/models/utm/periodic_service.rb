class Utm::PeriodicService < Utm::VolgaspotRecord
  has_and_belongs_to_many :tariffs, class_name: "Utm::PeriodicService", join_table: "tariffs_services_link",
    foreign_key: :tariff_id, association_foreign_key: :service_id
  self.table_name = "periodic_services_data"

  alias_attribute :cost_month, :cost

  delegate :name, :description, :type_of_service, to: :service_data

  SERVICE_TYPES = [2, 5]

  def service_data
    @service_data ||= Utm::ServiceData
      .where(service_type: SERVICE_TYPES)
      .find id
  end

  def cost_day
    days_in_month = Time.days_in_month(Date.current.month)
    (cost_month.to_f / days_in_month).round 2
  end
end
