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
        relationships: {
          :"#{type}" => wildcard_matcher
        }
      }
    end

    def inclusion(type, attributes)
      {
        included: [
          {
            type: type,
            attributes: require_attributes_presence(attributes)
          }
        ]
      }
    end

    def collection(num, attributes)
      { data: Array.new(num, attributes) }
    end
  end
end
