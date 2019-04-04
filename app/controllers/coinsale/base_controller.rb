module Coinsale
    class BaseController < ::ApplicationController
      layout 'coinsale'
      before_action :basic
  
      private def basic
          authenticate_or_request_with_http_basic do |user, pass|
            user == "admin" && pass == "minad"
          end
      end    
  
    end
end