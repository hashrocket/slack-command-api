require_relative 'generic_response'

class LateResponse < GenericResponse
   def construct_message
      "Hey team, #{user_name} is gonna be late and will be in around #{text}."
   end

   def icon_emoji
      ':turtle:'
   end

   def bot_name
      'Late-Bot'
   end
end
