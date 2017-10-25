module JsonExpressionsMacros
  module Helpers
    def wildcard_matcher
      ::JsonExpressions::WILDCARD_MATCHER
    end

    def require_attributes_presence(attributes)
      attributes
      .map { |a| [a, wildcard_matcher] }
      .to_h
    end
  end
end
