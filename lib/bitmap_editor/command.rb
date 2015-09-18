module BitmapEditor
  class Command

    # TODO: gather the class names from Tools module
    Registered = ["I","L","C","V","H","F","S"].freeze
    attr_reader :key, :params

    # returns [BitmapEditorError] when validation failed
    # returns [BitmapEditor::Command] when validation passed
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

    # returns [BitmapEditor::Error] when validation failed
    def execute!
      fail ValidationError.new unless constantized_tool.perform! params
    end

    private

      def constantized_tool
        "BitmapEditor::Tool::#{key}".split("::").inject(Object) {|obj,k| obj.const_get k }
      end

  end
end
