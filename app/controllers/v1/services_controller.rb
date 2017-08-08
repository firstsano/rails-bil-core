class V1::ServicesController < V1::BaseController
  def index
    render Utm::PeriodicService.where(id: current_user.service_ids)
  end
end
