class CommandProcessor
   def initialize(data)
      @text      = data[:text]
      @user_name = data[:user_name]
   end

   def process_late_command
      {'text' => "Hey team, #{@user_name} is gonna be late. He/She will be in around #{@text}."}
   end
end
