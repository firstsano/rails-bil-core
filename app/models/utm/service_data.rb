class Utm::ServiceData < Utm::VolgaspotRecord
  self.table_name = "services_data"

  belongs_to :parent, foreign_key: :parent_service_id, class_name: 'ServiceData', required: false

  alias_attribute :name, :service_name
  alias_attribute :description, :comment

  def type_of_service
    parent&.name
  end
end
