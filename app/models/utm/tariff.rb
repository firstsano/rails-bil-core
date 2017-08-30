class Utm::Tariff < Sequel::Model(RCore::SequelDb.utm_db[:tariffs])
  many_to_many :tariffs, class_name: "Utm::Tariff", join_table: "tariffs_services_link",
    foreign_key: :service_id, association_foreign_key: :tariff_id
end
