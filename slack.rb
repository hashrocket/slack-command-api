require_relative 'command_processor'

class Slack
   def self.post_late_response(params)
      response = CommandProcessor.new(params).process_late_command.to_json
      RestClient.post(ENV['SLACK_LATE_URL'], response)
   end
end
