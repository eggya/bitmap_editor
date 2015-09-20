require "readline"

module BitmapEditor
  class App

    Terminates = %w(X)
    Printer = %w(S)
    
    attr_reader :bitmap

    # application runner
    def self.run!
      new.run!
    end

    # placeholder to initiate
    def initialize
      @bitmap = Bitmap.new
    end

    # read lines as commands and return action accordingly
    # rescue SIGINT and exit console
    def run!
      begin
        while line = Readline.readline("> ", true)
          keys = line.split

          case keys.first
          when "X" then exit
          when "S" then printf BitmapEditor::Tool::S.perform! bitmap,[]
          else BitmapEditor::Command.execute bitmap,keys
          end
        end
      
      rescue Error => e
        warn e.message
        retry
      rescue Interrupt
        exit
      end
    end

  end
end
