require 'bundler'
Bundler.require
Dotenv.load
post '/late' do
   params['text'] = "Hey team, #{params[:user_name]} is gonna be late. He/She will be in around #{params[:text].strip}."
   RestClient.post(ENV['SLACK_URL'], params.to_json)
end

