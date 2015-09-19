module BitmapEditor
  class Command

    # TODO: gather the class names from Tools module
    Registered = ["I","L","C","V","H","F","S"].freeze
    attr_reader :key, :params, :bitmap

    # returns [BitmapEditorError] when validation failed
    # returns [BitmapEditor::Command] when validation passed
    def self.execute bitmap,keys
      fail InvalidCommand.new(keys) unless Registered.include? keys.first
      new(bitmap,keys)
    end

    # initialize
    def initialize bitmap,keys
      @bitmap = bitmap
      @key    = keys.shift
      @params = keys
      
      execute!
    end

    # returns [BitmapEditor::Error] when validation failed
    def execute!
      fail ValidationError.new unless constantized_tool.perform! bitmap,params
    end

    private

      def constantized_tool
        "BitmapEditor::Tool::#{key}".split("::").inject(Object) {|obj,k| obj.const_get k }
      end

  end
end
