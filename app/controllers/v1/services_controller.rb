class V1::ServicesController < V1::BaseController
  def index
    render current_user.services
  end
end
