require 'spec_helper'

describe GenericResponse do
  class Child < GenericResponse; end

  let(:child_class) do
    Child.new('params')
  end

  it 'throws a construct_message not implemented error' do
    expect{child_class.construct_message}.to raise_error NotImplementedError
  end

  it 'throws an icon_emoji not implemented error' do
    expect{child_class.icon_emoji}.to raise_error NotImplementedError
  end

  it 'throws a bot_name not implemented error' do
    expect{child_class.bot_name}.to raise_error NotImplementedError
  end

end
