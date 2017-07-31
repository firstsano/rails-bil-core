class Service < VolgaspotRecord
  self.table_name = "services_data"

  alias_attribute :name, :service_name
  belongs_to :parent, foreign_key: :parent_service_id, class_name: 'Service', required: false

  attr_writer :cost_month

  def cost_month
    @cost_month || 0
  end

  def cost_day
    days_in_month = Time.days_in_month(Date.current.month)
    (cost_month.to_f / days_in_month).round 2
  end

  def service_type_name
    parent&.service_name
  end
end
