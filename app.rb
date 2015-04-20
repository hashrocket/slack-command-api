require 'bundler'
Bundler.require

get '/late' do
  "Hey team, I'm gonna be late. I'll be in around #{params[:text].strip}."
end
