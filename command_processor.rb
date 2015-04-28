class CommandProcessor
   attr_reader :text, :user_name

   def initialize(data)
      @text, @channel = data[:text].split(/(?=#)/).map(&:strip)
      @user_name      = data[:user_name]
   end

   def process_late_command
      {
         'text'    => "Hey team, #{user_name} is gonna be late. He/She will be in around #{text}.",
         'channel' => channel
      }
   end

   def channel
      @channel || "#announcements"
   end
end
