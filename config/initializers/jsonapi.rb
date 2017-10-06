module JSONAPI
  module Serializer
    def self.safe_serialize(objects, options = {})
      serialize objects, options
    rescue NameError
      { data: objects }
    end
  end
end
