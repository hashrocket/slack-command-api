require_relative 'response'

class Slack
  attr_reader :response

  def initialize(response)
    @response = response
  end

  def post
    RestClient.post(ENV['SLACK_URL'], payload)
  end

  def payload
    {
      'text'       => response.construct_message,
      'channel'    => response.channel,
      'icon_emoji' => response.icon_emoji,
      'username'   => response.bot_name
    }.to_json
  end
end
