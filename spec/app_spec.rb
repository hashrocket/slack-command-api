require '../app'
require 'rspec'
require 'rack/test'
require 'webmock/rspec'

describe 'Slack Late API' do
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
        command:      '/weather',
        text:         '10AM'
    }
  end

  it 'accepts data and posts it back to Slack' do
    stub_request(:post, 'http://www.example.com').to_return(body: 'foobar')
    post '/late', data
    expect(last_response).to be_ok
  end

end
