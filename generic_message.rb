class MethodNotImplementedError < StandardError
end

class GenericMessage
   def call
      raise MethodNotImplementedError, "Implement the #call method in your subclass because Slack#response is dependent on it"
   end

   def channel
      raise MethodNotImplementedError, "Implement the #channel method in your subclass because Slack#response is dependent on it"
   end
end
