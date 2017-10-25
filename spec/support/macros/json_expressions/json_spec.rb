require_relative '../json_expressions_macros'

module JsonExpressionsMacros
  module JsonSpec
    include ::JsonExpressionsMacros::Helpers

    def resource(attributes)
      attributes_matcher = attributes ? require_attributes_presence(attributes) : Array
      {
        id: wildcard_matcher,
        type: wildcard_matcher,
        attributes: attributes_matcher
      }
    end

    def relationships(type)
      {
        data: [
          relationships: {
            :"#{type}" => wildcard_matcher
          }
        ]
      }
    end

    def inclusion(type)
      {
        included: [
          {
            type: type
          }
        ]
      }
    end

    def collection(items:, attributes: nil)
      resource_attributes = resource attributes
      collection = Array.new items, resource_attributes
      { data: collection.strict! }
    end
  end
end
