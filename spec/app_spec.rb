require '../app'
require 'rspec'
require 'rack/test'

describe 'Slack Late API' do
 include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'says you are going to be late' do
    get '/late', text: '10AM'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Hey team, I'm gonna be late. I'll be in around 10AM.")
  end

end
