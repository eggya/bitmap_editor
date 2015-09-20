module BitmapEditor
  module Tool
    class S < Base

      # returns [Boolean] True when validation passed
      def validate
        fail ParamsValidationError.new(params.count,0) unless params.empty?
      end

      protected

        def perform
          bitmap.pixels.inject("") {|res,col| res = res + (col.join + "\n") }
        end
      
    end
  end
end
