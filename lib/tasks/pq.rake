# encoding: utf-8

# bundle exec rails pq:run

namespace :pq do
    task run: :environment do |task, args|
      
      rk = Rubykube.new
      for i in 100..200 do
        rk.buy(1,i)
      end
    end
end
