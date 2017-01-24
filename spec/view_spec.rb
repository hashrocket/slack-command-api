require_relative 'spec_helper'

describe 'Views' do
  let(:app) { Sinatra::Application }

  it 'renders the home page' do
    get '/'
    expect(last_response.body).to include 'Getting Started'
  end
end
