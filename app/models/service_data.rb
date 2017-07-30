class ServiceData < VolgaspotRecord
  self.table_name = "services_data"

  alias_attribute :name, :service_name
  belongs_to :parent, foreign_key: :parent_service_id, class_name: 'ServiceData', required: false

  def service_type_name
    parent&.service_name
  end
end
