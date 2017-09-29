module V1
  class TariffsController < BaseController
    def index
      @tariffs = Utm::Tariff.all
      render @tariffs
    end

    def available
      render []
    end
  end
end
