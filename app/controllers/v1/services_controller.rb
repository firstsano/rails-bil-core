class V1::ServicesController < V1::BaseController
  def index
    @services = Utm::PeriodicService
      .where(id: current_user.service_ids)
      .all
    render @services
  end
end
