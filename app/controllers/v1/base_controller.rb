class V1::BaseController < ActionController::API
  include Knock::Authenticable
  include ::ExceptionsHandler

  before_action :authenticate_user

  def render(resource)
    super json: resource, include: inclusion_options
  end

  def prepare_date_range
    from, to = get_filter_params(:from, :to)
    from, to = (from&.to_datetime or DateTime.now), to&.to_datetime
    @date_range = DateTimeRange.generate start: from, stop: to
  end

  private

  def inclusion_options
    return [] unless params[:include]
    params[:include]
      .split(/[,\.]/)
      .uniq
      .map(&:underscore)
  end

  def get_filter_params(*attributes)
    return attributes.count.times.map { nil } unless params[:filter]
    params[:filter].values_at *attributes
  end
end
