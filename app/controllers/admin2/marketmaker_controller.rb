# encoding: UTF-8
# frozen_string_literal: true

module Admin2
  class MarketmakerController < BaseController
    #http://api.wb.local/admin2/marketmaker?side=bid&p=1&v=2&it=3&commit=exec
    def index
      
      #side = params[:side]
      #p = params[:p]
      #v = params[:v]
      #it = params[:it]

      rk = Rubykube.new
      rk.sell(1,100)

    end

  end
end
