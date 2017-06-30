class Api::V1::BaseController < ActionController::API
  include Knock::Authenticable

  before_action :authenticate_user
end
