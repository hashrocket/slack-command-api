class TimeOffMessage

   def construct_message(text, timeoff_text, user_name)
      "Hey guys, #{user_name} is gonna be out #{timeoff_text}."
   end

   def icon_emoji
      ':whale:'
   end

   def bot_name
      'Time-Off-Bot'
   end

end
