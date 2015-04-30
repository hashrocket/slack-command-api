require_relative 'spec_helper'

describe 'API' do

  let(:app) { Sinatra::Application }

  before do
    stub_request(:post, 'www.example.com')
    expect(RestClient).to receive(:post)
  end

  it 'POST /late' do
    post '/late', {text: '10AM #testing'}.to_json
    expect(last_response).to be_ok
  end

  it 'POST /timeoff' do
    post '/timeoff', {text: 'Monday, Wednesday'}.to_json
    expect(last_response).to be_ok
  end
end
