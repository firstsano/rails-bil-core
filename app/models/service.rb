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

  def cost_day
    days_in_month = Time.days_in_month(Date.current.month)
    cost_month ? cost_month.to_f / days_in_month : nil
  end

  private

  def whitelist_params
    [:cost_month]
  end
end
