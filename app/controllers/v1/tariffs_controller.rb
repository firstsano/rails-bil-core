module V1
  class TariffsController < BaseController
    def index
      @tariffs = current_user
                 .tariffs
                 .all
      render @tariffs
    end

    def available
      @tariffs = current_user
                 .available_tariffs
                 .all
      render @tariffs
    end
  end
end
