class Utm::PeriodicServiceSerializer < ActiveModel::Serializer
  type :services

  attributes :id, :name, :type_of_service, :description, :cost_month, :cost_day
end
