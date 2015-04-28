require './app'
require 'rspec'
require 'rack/test'
require 'webmock/rspec'
include Rack::Test::Methods

def app
  Sinatra::Application
end

def data
  {
      token:        'KjRUKVRBoQVerm6bJTymvOe0',
      team_id:      'T0001',
      team_domain:  'example',
      channel_id:   'C2147483705',
      channel_name: 'test',
      user_id:      'U2147483697',
      user_name:    'Steve',
      command:      '/late',
      text:         '10AM'
  }
end
