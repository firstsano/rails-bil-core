class V1::BaseController < ActionController::API
  include Knock::Authenticable

  before_action :authenticate_user

  def render(resource)
    super json: resource, include: inclusion_filter
  end

  def inclusion_filter
    return [] unless params[:include]
    params[:include].split(/[,\.]/).uniq
  end
end
