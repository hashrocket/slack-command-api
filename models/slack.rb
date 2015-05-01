require_relative 'response'

class Slack

   attr_reader :request

   def initialize(request)
      @request = request
   end

   def post
      RestClient.post(ENV['SLACK_URL'], payload)
   end

   def payload
      {
         'text'       => request.construct_message,
         'channel'    => request.channel,
         'icon_emoji' => request.icon_emoji,
         'username'   => request.bot_name
      }.to_json
   end

end
