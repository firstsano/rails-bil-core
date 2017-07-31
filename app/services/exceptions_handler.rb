module ExceptionsHandler
  extend ActiveSupport::Concern

  class RemoteRequestError < StandardError; end

  included do
    rescue_from ExceptionsHandler::RemoteRequestError, with: :bad_request
  end

  private

  def bad_request(error)
    render []
    # json_response({ message: error.message }, :bad_request)
  end
end
