require_relative 'generic_response'

class TimeOffResponse < GenericResponse

   def construct_message
      "Hey guys, #{user_name} is gonna be out #{timeoff_text}."
   end

   def icon_emoji
      ':whale'
   end

   def bot_name
      'Time-Off-Bot'
   end

end
