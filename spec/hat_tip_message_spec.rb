require_relative 'spec_helper'

describe HatTipMessage do
  let(:data) do
    {
      token:        'KjRUKVRBoQVerm6bJTymvOe0',
      team_id:      'T0001',
      team_domain:  'example',
      channel_id:   'C2147483705',
      channel_name: 'other_channel',
      user_id:      'U2147483697',
      user_name:    'Steve',
      command:      '/hat_tip',
      text:         '#taylor'
    }
  end

  it '#construct_message constructs a hat tipping message' do
    expect(described_class.new.construct_message(data[:text], data[:user_name])).to eq ':boom: Steve tips their hat to #taylor! :ok_hand:'
  end

  it '#icon_emoji returns a string' do
    expect(described_class.new.icon_emoji).to be_a String
  end

  it '#bot_name returns a string' do
    expect(described_class.new.bot_name).to be_a String
  end
end
