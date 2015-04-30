require_relative 'spec_helper'

describe Slack do

  let(:app) { Sinatra::Application }

  let(:data) do
    {
        token:        'KjRUKVRBoQVerm6bJTymvOe0',
        team_id:      'T0001',
        team_domain:  'example',
        channel_id:   'C2147483705',
        channel_name: 'other_channel',
        user_id:      'U2147483697',
        user_name:    'Steve',
        command:      '/late',
        text:         '10AM'
    }
  end

  let(:late_message) { LateMessage.new(data) }

  it 'accepts data and posts it back to Slack' do
    stub_request(:post, 'http://www.example.com').to_return(body: 'foobar')
    expect(RestClient).to receive(:post)
    described_class.new(late_message, 'www.example.com').post
  end

  it 'returns a json response' do
    response = described_class.new(late_message, 'www.example.com').response
    expect(response).to include "{\"text\""
  end
end
