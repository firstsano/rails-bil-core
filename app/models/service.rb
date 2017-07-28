class Service < VolgaspotRecord
  self.table_name = "services_data"

  alias_attribute :name, :service_name
  belongs_to :parent, foreign_key: :parent_service_id, class_name: 'Service', required: false

  attr_accessor :cost_month

  def cost_day
    cost_month ? cost_month / 30 : 0
  end

  def service_type_name
    parent.service_name if parent
  end
end
