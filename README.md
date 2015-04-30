# Slack Command API

This Sinatra API converts custom Slack commands into Bot messages.
The API will post to your current channel by default, but you can specify a channel: `/late 10AM #another_channel`

Example:
A `/late 10AM` command converts to a text response **Hey team, I'm gonna be in around 10AM.**

## Dependencies

* RVM
* Ruby 2.2.2
* Sinatra
* Testing: RSpec

## Getting Started
1. `git clone` the app
2. `cd` into the folder.
3. Bundle the gems. `bundle install`
4. Set your Slack webhook environment variables. Create a `.env` file. Populate it with a `DEFAULT_SLACK_URL` and all of the webhook URLs (ex: `SLACK_LATE_URL`) variable for your app's incoming webhook.
4. Run the app with `bundle exec passenger start`

## Adding a New Command in 2 steps

Create a response object that constructs a message, gives the bot a name, and gives it an emojo.

```
require_relative 'generic_response'

class YourCommandResponse < GenericResponse

  def construct_message
    "This will show up in slack and can show the #{user_name} of who issued the command, the #{text} of the command, and the desired #{channel} for where the response is going to go."
  end

  # Your bot will be named 'Your-Command-Bot'
  def bot_name
    'Your-Command-Bot'
  end

  # This will show a whale icon for your chat bot
  def icon_emoji
   ':whale:'
  end
end
```

Add a post url to `app.rb`

```
# ...
post '/your_command_url' do
  message = YourCommandResponse.new(params)
  Slack.new(message).post
end
# ...
```

Done.

## Testing
1. Head to the spec folder. `cd spec`
2. Run the tests with `rspec`

## Credits
Maintainer: [Joshua Plicque](https://twitter.com/GoHard_EveryDay)
If you have any questions, send me a tweet.
