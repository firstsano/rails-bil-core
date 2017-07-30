class Service
  include ActiveModel::Model
  include ActiveModel::Serialization
  include WhitelistAttributes

  attr_reader :id
  attr_accessor :cost_month

  def initialize(id, params = {})
    @id = id
    super params
  end

  def service_data
    @service_data ||= ServiceData.find id
  end

  private

  def whitelist_params
    [:cost_month]
  end
end
