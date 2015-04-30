require_relative 'params_processor'

class GenericResponse

   extend Forwardable

   delegate [:timeoff_text, :user_name, :channel, :text] => :processor

   def initialize(params)
      @params = params
   end

   def construct_message
      raise NotImplementedError, "Implement the #construct_message method in your subclass because Slack#response is dependent on it"
   end

   def icon_emoji
      raise NotImplementedError, "Implement the #icon_emoji method in your subclass because Slack#response is dependent on it"
   end

   def bot_name
      raise NotImplementedError, "Implement the #bot_name method in your subclass because Slack#response is dependent on it"
   end

   private

   def processor
      @processor ||= ParamsProcessor.new(@params)
   end

end
