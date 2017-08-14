class Utm::Tariff < Utm::VolgaspotRecord
  has_and_belongs_to_many :tariffs, class_name: "Utm::Tariff", join_table: "tariffs_services_link",
    foreign_key: :service_id, association_foreign_key: :tariff_id

  self.table_name = "tariffs"
end
