class V1::BaseController < ActionController::API
  include Knock::Authenticable
  include ::ExceptionsHandler

  before_action :authenticate_user

  def render(resource)
    super json: resource, include: inclusion_options
  end

  private

  def inclusion_options
    return [] unless params[:include]
    params[:include]
      .split(/[,\.]/)
      .uniq
      .map(&:underscore)
  end

  def filter_params(*attributes)
    return attributes.count.times.map { nil } unless params[:filter]
    params[:filter].values_at *attributes
  end
end
