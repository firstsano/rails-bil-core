module V1
  class BaseController < ::ActionController::API
    include Knock::Authenticable
    include ::ExceptionsHandler

    before_action :authenticate_user

    def render(resource)
      super json: serialize_model(resource)
    end

    def prepare_date_range
      from, to = get_filter_params(:from, :to)
      from = from&.to_datetime || DateTime.now
      to = to&.to_datetime
      @date_range = DateTimeRange.generate start: from, stop: to
    end

    def serialize_model(model, options = {})
      options[:is_collection] = model.respond_to? :each
      options[:include] = params[:include]
      JSONAPI::Serializer.safe_serialize(model, options)
    end

    private

    def get_filter_params(*attributes)
      return Array.new(attributes.count) { nil } unless params[:filter]
      params[:filter].values_at(*attributes)
    end
  end
end
