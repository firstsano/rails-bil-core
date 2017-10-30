module Utm
  class PeriodicServiceSerializer < ::ActiveModel::Serializer
    attributes :id, :name, :type_of_service, :description, :cost_month, :cost_day
  end
end
