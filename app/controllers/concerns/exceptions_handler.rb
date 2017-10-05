module ExceptionsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Exceptions::RemoteRequestError, with: :bad_request
    rescue_from Exceptions::RecordNotFound, with: :bad_request
  end

  private

  def bad_request(error)
    render []
  end
end
