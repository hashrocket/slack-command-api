require 'bundler'
require_relative 'slack'
Bundler.require
Dotenv.load

post '/late' do
   Slack.post_late_response(params)
end

get '/' do
   markdown :index
end

