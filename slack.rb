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
         'text'    => message.call,
         'channel' => message.channel
      }.to_json
   end
end
