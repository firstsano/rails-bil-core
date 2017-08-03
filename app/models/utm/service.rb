class Utm::Service < Utm::VolgaspotRecord
  self.table_name = "services_data"

  alias_attribute :name, :service_name
  belongs_to :parent, foreign_key: :parent_service_id, class_name: 'Service', required: false

  PERIODIC_SERVICE_TYPES = [2, 5]

  delegate :cost_month, :cost_day, to: :service_data, allow_nil: true

  def service_data
    @service_data ||= Utm::PeriodicServiceData.find(id) if is_periodic_service?
  end

  def is_periodic_service?
    PERIODIC_SERVICE_TYPES.include? service_type
  end

  def service_type_name
    parent&.service_name
  end
end
