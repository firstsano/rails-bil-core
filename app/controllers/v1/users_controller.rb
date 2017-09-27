module V1
  class UsersController < BaseController
    def show
      render current_user
    end
  end
end
