require_relative '../json_expressions_macros'

module JsonExpressionsMacros
  module RubyAttributesSpec
    include ::JsonExpressionsMacros::Helpers

    def resource(attributes)
      if attributes
        require_attributes_presence(attributes)
      else
        Hash
      end
    end

    def relationships(type)
      { :"#{type}" => wildcard_matcher }
    end

    def inclusion(type, attributes)
      [ { :"#{type}" => require_attributes_presence(attributes) } ]
    end

    def collection(num, attributes)
      Array.new num, attributes
    end
  end
end
