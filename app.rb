require 'bundler'
Bundler.require
Dotenv.load
require_relative 'command_processor'

post '/late' do
   response = CommandProcessor.new(params).process_late_command.to_json
   RestClient.post(ENV['SLACK_LATE_URL'], response)
end

