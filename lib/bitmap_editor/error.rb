module BitmapEditor
  class Error < StandardError; end

  class ValidationError < Error
    def initialize
      super("Validation error")
    end
  end

  class InvalidCommand < Error
    def initialize keys
      super(["Invalid command: #{keys.first}", "Try H for help, or X to exit"].join("\n"))
    end
  end
end
