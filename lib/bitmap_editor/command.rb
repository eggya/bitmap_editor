module BitmapEditor
  class Command

    # TODO: tranform to hash / struct to then execute command to Tools/File
    Registered = ["I","L","C","V","H","F","S"].freeze

    # returns [BitmapEditorError] when validation failed
    # returns [BitmapEditor::Command] when passed validation
    def self.execute keys
      fail InvalidCommand.new(keys) unless Registered.include? keys.first
      new keys
    end

    # initialize
    def initialize keys
      @key    = keys.shift
      @params = keys
      execute!
    end

    # returns [BitmapEditorError] on unsuccesful command performance
    # returns [Boolean] True on succefully performed command
    def execute!
      #TBA
    end

  end
end
