require_relative 'spec_helper'

describe 'Slack Late API' do

  it 'accepts data and posts it back to Slack' do
    stub_request(:post, 'http://www.example.com').to_return(body: 'foobar')
    expect(RestClient).to receive(:post)
    post '/late', data
  end

end
