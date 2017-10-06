module JsonExpressions
  def simple_response_pattern
    { data: wildcard_matcher }
  end

  def collection_response_pattern(collection)
    { data: collection.strict! }
  end

  def response_pattern(with_items: false, required_attributes: nil)
    return simple_response_pattern unless with_items
    collection_response_pattern with_items.times.map { resource_pattern required_attributes }
  end

  def resource_pattern(attributes = nil)
    {
      id: wildcard_matcher,
      type: wildcard_matcher,
      attributes: resource_attributes_pattern(attributes)
    }
  end

  def resource_attributes_pattern(attributes = nil)
    return Array unless attributes
    Hash[ attributes.map { |a| [a, wildcard_matcher] } ]
  end

  def relationships_pattern(type)
    {
      data: [
        relationships: {
          :"#{type}" => wildcard_matcher
        }
      ]
    }
  end

  def inclusion_pattern(type)
    {
      included: [
        {
          type: type
        }
      ]
    }
  end
end
