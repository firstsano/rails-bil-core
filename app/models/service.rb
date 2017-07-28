class Service < VolgaspotRecord
  self.table_name = "services_data"

  alias_attribute :name, :service_name
  belongs_to :parent, foreign_key: :parent_service_id, class_name: 'Service', required: false
end
