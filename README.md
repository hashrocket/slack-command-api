# Slack Command API

This Sinatra API converts custom Slack commands into Bot messages.

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
4. Run the app with `bundle exec rackup`

## Testing
1. Head to the spec folder. `cd spec`
2. Run the tests with `rspec`

## Credits
Maintainer: [Joshua Plicque](https://twitter.com/GoHard_EveryDay)
If you have any questions, send me a tweet.
