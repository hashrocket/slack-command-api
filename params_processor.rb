class ParamsProcessor
   attr_reader :params

   def initialize(params)
      @params = params
   end

   def text
      text_values.first
   end

   def channel
      text_values[1] || "#announcements"
   end

   def user_name
      params[:user_name]
   end

   private

   def text_values
      params[:text] ? params[:text].split(/(?=#)/).map(&:strip) : [""]
   end
end

