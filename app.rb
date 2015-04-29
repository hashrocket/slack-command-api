require 'bundler'
require_relative 'slack'
require_relative 'late_message'
require_relative 'params_processor'
Bundler.require
Dotenv.load


post '/late' do
   message = LateMessage.new(params)
   Slack.new(message, ENV['SLACK_LATE_URL']).post
end

#post '/timeoff' do
   # message = TimeOffMessage.new(params)
   # Slack.new(message, ENV['SLACK_TIMEOFF_URL'].post
#end

get '/' do
   markdown :index
end

