require_relative 'params_processor'

class GenericMessage
   def call
      raise MethodNotImplemented
   end

   def channel
      raise MethodNotImplemented
   end
end


class LateResponse < GenericMessage
   extend Forwardable

   delegate [:text, :user_name, :channel] => :processor

   def initialize(params)
      @params = params
   end

   def call
      "Hey team, #{user_name} is gonna be late and will be in around #{text}."
   end

   private

   def processor
      @processor ||= ParamsProcessor.new(@params)
   end
end
