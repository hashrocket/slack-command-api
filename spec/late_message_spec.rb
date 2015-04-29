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

  it 'makes a sentence' do
    expect(described_class.new(data).call).to eq 'Hey team, Steve is gonna be late and will be in around 10AM.'
  end

end
