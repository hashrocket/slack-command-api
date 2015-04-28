class CommandProcessor
   def initialize(data)
      @text      = data[:text]
      @user_name = data[:user_name]
   end

   def process_late_command
      if @text.include?('#')
         {'text' => "Hey team, #{@user_name} is gonna be late. He/She will be in around #{process_text}.", 'channel' => process_channel}
      else
         {'text' => "Hey team, #{@user_name} is gonna be late. He/She will be in around #{@text}."}
      end
   end

   private

     def process_text
        @text.split('#')[0].strip
     end

     def process_channel
        @text[@text.index('#')..-1]
     end
end
