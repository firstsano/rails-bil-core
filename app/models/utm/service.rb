class Utm::Service < Utm::VolgaspotRecord
  self.table_name = "services_data"

  alias_attribute :name, :service_name
  belongs_to :parent, foreign_key: :parent_service_id, class_name: 'Service', required: false

  PERIODIC_SERVICE_TYPES = [2, 5]

  delegate :cost_month, to: :service_data

  def service_data
    @service_data ||= Utm::PeriodicServiceData.find(id) if is_periodic_service?
  end

  def is_periodic_service?
    PERIODIC_SERVICE_TYPES.include? service_type
  end

  def cost_day
    raise Exceptions::EmptyRelationError.new unless service_data
    days_in_month = Time.days_in_month(Date.current.month)
    (cost_month.to_f / days_in_month).round 2
  end

  def service_type_name
    parent&.service_name
  end
end
