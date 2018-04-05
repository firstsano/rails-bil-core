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

    # PUT /tariffs/index
    def connect
      tariff_id = params.require(:tariff_id)
      render current_user.link_tariff tariff_id
      head :no_content
    end

    # DELETE /tariffs/index
    def disconnect
      current_user.unlink_tariff
      head :no_content
    end
  end
end
