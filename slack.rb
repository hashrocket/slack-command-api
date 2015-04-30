class Slack
   attr_reader :message

   def initialize(message)
      @message = message
   end

   def post
      RestClient.post(ENV['SLACK_URL'], response)
   end

   def response
      {
         'text'       => message.construct_message,
         'channel'    => message.channel,
         'icon_emoji' => message.icon_emoji,
         'bot_name'   => message.bot_name
      }.to_json
   end
end
