module Utm
  class Tariff < ::Sequel::Model(RCore::SequelDb.utm_db[:tariffs])
    include ReadOnlyRecords

    many_to_many :periodic_services, class: Utm::PeriodicService, join_table: "tariffs_services_link",
                                     left_key: :service_id, right_key: :tariff_id
  end
end
