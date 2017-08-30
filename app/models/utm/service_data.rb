class Utm::ServiceData < Sequel::Model(RCore::SequelDb.utm_db[:services_data])
  one_to_one :parent, foreign_key: :parent_service_id, class_name: 'ServiceData', required: false

  alias_attribute :name, :service_name
  alias_attribute :description, :comment

  def type_of_service
    parent&.name
  end
end
