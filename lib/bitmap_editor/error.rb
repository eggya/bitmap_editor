module BitmapEditor
  class Error < StandardError; end

  class ValidationError < Error
    def initialize msg=nil
      super(["Validation error",msg].compact.join(": "))
    end
  end

  class ParamsValidationError < Error
    def initialize input,keys
      super("Validation error: #{input} params for #{keys}")
    end
  end

  class InvalidCommand < Error
    def initialize keys
      super("Invalid command: #{keys.first}")
    end
  end
end
