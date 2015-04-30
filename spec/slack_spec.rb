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

  let(:late_message) { LateResponse.new(data) }

  it 'accepts data and posts it back to Slack' do
    stub_request(:post, 'http://www.example.com').to_return(body: 'foobar')
    expect(RestClient).to receive(:post)
    described_class.new(late_message).post
  end

  it 'returns a json payload' do
    response = described_class.new(late_message).payload
    expect(response).to include "\"icon_emoji\""
    expect(response).to include "\"username\""
  end
end
