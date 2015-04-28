require_relative 'spec_helper'

describe 'Command Processor' do

  def app
    Sinatra::Application
  end

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

  let(:default_channel_processor) { CommandProcessor.new(data) }
  let(:custom_channel_processor) { CommandProcessor.new(custom_channel_data) }
  let(:custom_channel_data) do
    channel_data = data
    channel_data[:text] = '10AM #other_channel'
    channel_data
  end

  describe '#initialize' do
    it 'assigns @text on initialization' do
      expect(default_channel_processor.text).to eq('10AM')
      expect(default_channel_processor.channel).to eq('#announcements')
    end

    it 'assigns @channel on initialization' do
      expect(custom_channel_processor.text).to eq('10AM')
      expect(custom_channel_processor.channel).to eq('#other_channel')
    end
  end

  describe '#process_late_command' do
    it 'processes late command with default channel' do
      output = default_channel_processor.process_late_command
      expect(output).to eq({'text' => 'Hey team, Steve is gonna be late and will be in around 10AM.', 'channel' => '#announcements'})
    end

    it 'proceesses late command with custom channel' do
      output = custom_channel_processor.process_late_command
      expect(output).to eq({'text' => 'Hey team, Steve is gonna be late and will be in around 10AM.', 'channel' => '#other_channel'})
    end
  end

end
