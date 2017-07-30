class Service
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def service_data
    @service_data ||= ServiceData.find id
  end
end
