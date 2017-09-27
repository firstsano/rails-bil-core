module V1
  class ServicesController < BaseController
    def index
      @services = Utm::PeriodicService
                  .where(id: current_user.service_ids)
                  .all
      render @services
    end
  end
end
