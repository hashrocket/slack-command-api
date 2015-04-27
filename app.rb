require 'bundler'
Bundler.require

post '/late' do
   params['text'] = "Hey team, #{params[:user_name]} is gonna be late. This team member will be in around #{params[:text].strip}."
   RestClient.post(ENV['SLACK_POST_URL'], params.to_json)
end


