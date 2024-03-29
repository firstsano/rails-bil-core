module V1
  class BaseController < ::ActionController::API
    include Knock::Authenticable
    include ::ExceptionsHandler

    before_action :authenticate_user

    def render(resource)
      super json: resource, **render_options
    end

    def prepare_date_range
      from, to = get_filter_params(:from, :to)
      from = from&.to_datetime || DateTime.now
      to = to&.to_datetime
      @date_range = DateTimeRange.generate start: from, stop: to
    end

    def render_options
      { include: params[:include]&.underscore }
    end

    private

    def get_filter_params(*attributes)
      return Array.new(attributes.count, nil) unless params[:filter]
      params[:filter].values_at(*attributes)
    end
  end
end
