require 'bundler'
require_relative 'slack'
require_relative 'late_response'
require_relative 'time_off_response'
Bundler.require
Dotenv.load


post '/late' do
   message = LateResponse.new(params)
   Slack.new(message).post
end

post '/timeoff' do
   message = TimeOffResponse.new(params)
   Slack.new(message).post
end

get '/' do
   markdown :index
end

