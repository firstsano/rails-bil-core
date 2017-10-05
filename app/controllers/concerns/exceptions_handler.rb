module ExceptionsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Exceptions::RemoteRequestError, with: :service_unavailable
  end

  private

  def service_unavailable(error)
    head :service_unavailable
  end
end
