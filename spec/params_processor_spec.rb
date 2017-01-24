require_relative 'spec_helper'

describe ParamsProcessor do
  let(:data) do
    {
      token:        'KjRUKVRBoQVerm6bJTymvOe0',
      team_id:      'T0001',
      team_domain:  'example',
      channel_id:   'C2147483705',
      channel_name: 'default_channel',
      user_id:      'U2147483697',
      user_name:    'Steve',
      command:      '/late',
      text:         '10AM'
    }
  end

  let(:subject) { described_class.new(data) }

  it 'parses user name' do
    expect(subject.user_name).to eq('Steve')
  end

  it 'parses message text' do
    expect(subject.text).to eq('10AM')
  end

  it 'parses default channel' do
    expect(subject.channel).to eq('#default_channel')
  end

  it 'parses custom channel' do
    data[:text] = '10AM #other_channel'
    expect(subject.channel).to eq('#other_channel')
  end

  it 'parses no text' do
    data[:text] = nil
    expect(subject.channel).to eq('#default_channel')
    expect(subject.text).to eq('')
  end

  it 'parses timeoff text for one day' do
    data[:text] = "Monday"
    expect(subject.text).to eq('Monday')
  end

  it 'parses timeoff text for two days with a space' do
    data[:text] = "Monday, Tuesday"
    expect(subject.text).to eq('Monday through Tuesday')
  end

  it 'parses timeoff text for two days without a space' do
    data[:text] = 'Monday,Wednesday'
    expect(subject.text).to eq 'Monday through Wednesday'
  end
end
