require_relative 'spec_helper'

describe 'Views' do

  def app
    Sinatra::Application
  end

  it 'renders the home page' do
    get '/'
    expect(last_response.body).to include 'Getting Started'
  end

end
