class LateMessage

   def construct_message(text, timeoff_text, user_name)
      "Hey team, #{user_name} is gonna be late and will be in around #{text}."
   end

   def icon_emoji
      ':turtle:'
   end

   def bot_name
      'Late-Bot'
   end

end
