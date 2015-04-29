class Slack
   attr_reader :message, :url

   def initialize(message, url)
      @message = message
      @url     = url
   end

   def post
      RestClient.post(url, response)
   end

   def response
      {
         'text'    => message.call,
         'channel' => message.channel
      }
   end
end
