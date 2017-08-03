class Utm::PeriodicServiceData < Utm::VolgaspotRecord
  self.table_name = "periodic_services_data"

  alias_attribute :cost_month, :cost

  def cost_day
    days_in_month = Time.days_in_month(Date.current.month)
    (cost_month.to_f / days_in_month).round 2
  end
end
