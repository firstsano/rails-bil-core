class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :service_name, :comment
end
