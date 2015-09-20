module BitmapEditor
  module Tool
    class C < Base

      # returns [Boolean] True when validation passed
      def validate
        fail ParamsValidationError.new(params.count,0) unless params.empty?
      end

      protected
        
        def perform
          bitmap.pixels.each {|col| col.fill("O") }
        end
      
    end
  end
end
