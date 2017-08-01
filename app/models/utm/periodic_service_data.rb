class Utm::PeriodicServiceData < Utm::VolgaspotRecord
  self.table_name = "periodic_services_data"

  alias_attribute :cost_month, :cost
end
