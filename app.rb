require 'bundler'
Bundler.require
require 'net/http'

post '/late' do
   params['text'] = "Hey team, I'm gonna be late. I'll be in around #{params[:text].strip}."
   Net::HTTP.post_form(URI(ENV['SLACK_POST_URL']), JSON.parse(params.to_json))
end


