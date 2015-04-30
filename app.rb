require 'bundler'
require_relative 'slack'
require_relative 'late_message'
require_relative 'time_off_message'
Bundler.require
Dotenv.load

post '/late' do
   response = Response.new(params, LateMessage.new)
   Slack.new(response).post
end

post '/timeoff' do
   response = Response.new(params, TimeOffMessage.new)
   Slack.new(response).post
end

get '/' do
   markdown :index
end

