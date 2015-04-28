require_relative 'spec_helper'

describe 'Command Processor' do

  it 'processes a late command' do
    output = CommandProcessor.new(data).process_late_command
    expect(output).to eq({'text' => 'Hey team, Steve is gonna be late. He/She will be in around 10AM.'})
  end

end
