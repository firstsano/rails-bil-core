module ExceptionsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Exceptions::RemoteRequestError, with: :bad_request
  end

  private

  def bad_request(error)
    render []
    # json_response({ message: error.message }, :bad_request)
  end
end
