# encoding: UTF-8
# frozen_string_literal: true

namespace :mq do
  desc 'Test.'
  task send: :environment do
    print "Send start\n"
    AMQPQueue.enqueue(:withdraw_coin, id: 3)
    print "Send end\n"
  end

  task receive: :environment do
    print "Receive start\n"
    ENV['RAILS_ROOT'] = Rails.root.to_s
    Dir.chdir(Rails.root) do
      `bundle exec ruby lib/daemons/amqp_daemon.rb withdraw_coin`
    end    
    print "Receive end\n"
  end

end
