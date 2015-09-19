require "readline"

module BitmapEditor
  class App

    Terminates = %w(X)
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
          exit if line.split == Terminates
          BitmapEditor::Command.execute bitmap,line.split
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
