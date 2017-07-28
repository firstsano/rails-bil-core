class V1::ServicesController < V1::BaseController
  def index
    render Service.all
  end
end
