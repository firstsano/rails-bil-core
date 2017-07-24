class V1::UsersController < V1::BaseController
  def show
    render current_user
  end
end
