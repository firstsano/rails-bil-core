class V1::ServicesController < V1::BaseController
  def index
    render Utm::Service.where(id: current_user.service_ids)
  end
end
