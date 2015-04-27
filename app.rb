require 'bundler'
Bundler.require

post '/late' do
   params['text'] = "Hey team, I'm gonna be late. I'll be in around #{params[:text].strip}."
   RestClient.post(ENV['SLACK_POST_URL'], params.to_json)
end


