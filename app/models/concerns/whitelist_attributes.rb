module WhitelistAttributes
  extend ActiveSupport::Concern

  def initialize(attributes = {})
    set_attributes attributes
  end

  def set_attributes(attributes)
    assign_attributes attributes.slice(*whitelist_params)
    self
  end

  private

  def whitelist_params
    []
  end
end
