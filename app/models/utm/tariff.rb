class Utm::Tariff < Utm::VolgaspotRecord
  has_and_belongs_to_many :periodic_services, class_name: "Utm::PeriodicService", join_table: "tariffs_services_link",
    foreign_key: :tariff_id, association_foreign_key: :service_id

  self.table_name = "tariffs"
end
