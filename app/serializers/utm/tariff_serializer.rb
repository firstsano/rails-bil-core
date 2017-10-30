module Utm
  class TariffSerializer < ::ActiveModel::Serializer
    attributes :id, :name, :comments
  end
end
