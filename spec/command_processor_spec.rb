require_relative 'spec_helper'

describe 'Command Processor' do

  def app
    Sinatra::Application
  end

  def data
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

  it 'processes a late command' do
    output = CommandProcessor.new(data).process_late_command
    expect(output).to eq({'text' => 'Hey team, Steve is gonna be late. He/She will be in around 10AM.'})
  end

  it 'optionally posts to a custom channel' do
    channel_data = data
    channel_data[:text] = '10AM #other_channel'
    output = CommandProcessor.new(channel_data).process_late_command
    expect(output).to eq({'text' => 'Hey team, Steve is gonna be late. He/She will be in around 10AM.', 'channel' => '#other_channel'})
  end

end
