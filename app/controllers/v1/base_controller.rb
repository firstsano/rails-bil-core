class V1::BaseController < ActionController::API
  include Knock::Authenticable
  include ::ExceptionsHandler

  before_action :authenticate_user

  def render(resource)
    super json: serialize_model(resource)
  end

  def prepare_date_range
    from, to = get_filter_params(:from, :to)
    from, to = (from&.to_datetime or DateTime.now), to&.to_datetime
    @date_range = DateTimeRange.generate start: from, stop: to
  end

  def serialize_model(model, options = {})
    options[:is_collection] = model.is_a?(Array)
    options[:include] = params[:include]
    JSONAPI::Serializer.serialize(model, options)
  end

  private

  def get_filter_params(*attributes)
    return attributes.count.times.map { nil } unless params[:filter]
    params[:filter].values_at *attributes
  end
end
