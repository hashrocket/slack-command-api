class ParamsProcessor
   attr_reader :params

   def initialize(params)
      @params = params
   end

   def text
      text_values[0]
   end

   def timeoff_text
      text.gsub(' ', '').gsub(',', ' through ')
   end

   def channel
      text_values[1] || ENV['DEFAULT_SLACK_CHANNEL']
   end

   def user_name
      params[:user_name]
   end

   private

   def text_values
      params[:text] ? params[:text].split(/(?=#)/).map(&:strip) : [""]
   end

end

