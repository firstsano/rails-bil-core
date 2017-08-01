class Utm::ServiceSerializer < ActiveModel::Serializer
  type :services

  attributes :id, :name, :service_type, :description, :cost_month, :cost_day

  def service_type
    object.service_type_name
  end

  def description
    object.comment
  end
end
