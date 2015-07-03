# Slack Command API [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/hashrocket/slack-command-api)

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
4. Set your Slack webhook environment variable. Create a `.env` file. Populate it with a `SLACK_URL` variable for your app's incoming webhook.
4. Run the app with `bundle exec passenger start`

## Adding a New Command in 2 steps

Create a message object that constructs a message, gives the bot a name, and gives it an emoji.

```
class YourCommandMessage

  def construct_message(text, user_name)
    "This text will show up in Slack and can show the #{user_name} of who issued the command, along the #{text} of the command"
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
require_relative 'your_command_message'
# ...
post '/your_command_url' do
  response = Response.new(params, YourCommandMessage.new)
  Slack.new(response).post
end
# ...
```

Done.

## Testing
1. Head to the spec folder. `cd spec`
2. Run the tests with `rspec --color --format documentation`

## Credits
Maintainer: [Joshua Plicque](https://twitter.com/GoHard_EveryDay)
If you have any questions, send me a tweet.
