require_relative 'spec_helper'

describe LateMessage do
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

  it '#construct_message constructs a late sentence' do
    expect(described_class.new.construct_message(data[:text], data[:user_name])).to eq 'Hey team, Steve is gonna be late and will be in around 10AM.'
  end

  it '#icon_emoji returns a string' do
    expect(described_class.new.icon_emoji).to be_a String
  end

  it '#bot_name returns a string' do
    expect(described_class.new.bot_name).to be_a String
  end
end
