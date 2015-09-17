require "readline"

module BitmapEditor
  class App

    Terminates = %w(X)

    # application runner
    def self.run!
      new.run!
    end

    # placeholder to initiate
    def initialize; end

    # read lines as commands and return action accordingly
    # rescue SIGINT and exit console
    def run!
      begin
        while line = Readline.readline("> ", true)
          exit if line.split == Terminates
          BitmapEditor::Command.execute line.split
        end
      
      rescue Interrupt
        exit
      end
    end

  end
end
