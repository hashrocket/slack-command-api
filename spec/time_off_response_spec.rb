require_relative 'spec_helper'

describe TimeOffResponse do
  let(:data) do
    {
      token:        'KjRUKVRBoQVerm6bJTymvOe0',
      team_id:      'T0001',
      team_domain:  'example',
      channel_id:   'C2147483705',
      channel_name: 'other_channel',
      user_id:      'U2147483697',
      user_name:    'Steve',
      command:      '/timeoff',
      text:         'Monday'
    }
  end

  it '#construct_message constructs a timeoff sentence for one day' do
    expect(described_class.new(data).construct_message).to eq 'Hey guys, Steve is gonna be out Monday.'
  end

  it '#icon_emoji returns a string' do
    expect(described_class.new(data).icon_emoji).to be_a String
  end

  it '#bot_name returns a string' do
    expect(described_class.new(data).bot_name).to be_a String
  end
end
