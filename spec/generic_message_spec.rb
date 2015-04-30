require 'spec_helper'

describe GenericMessage do

  class Child < GenericMessage; end

  let(:child_class) do
    Child.new
  end

  it 'throws a call not implemented error' do
    expect{child_class.call}.to raise_error MethodNotImplementedError
  end
  it 'throws a channel not implemented error' do
    expect{child_class.channel}.to raise_error MethodNotImplementedError

  end
end
