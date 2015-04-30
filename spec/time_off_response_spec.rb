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

  it '#call constructs a timeoff sentence for one day' do
    expect(described_class.new(data).call).to eq 'Hey guys, Steve is gonna be out Monday.'
  end

end
