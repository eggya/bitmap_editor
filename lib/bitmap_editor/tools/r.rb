module BitmapEditor
  module Tool
    class R < Base

      # returns [Boolean] True when validation passed
      def validate
        fail ParamsValidationError.new(params.count,0) unless params.empty?
      end

      protected

        def perform
          bitmap.pixels = bitmap.pixels.transpose.map &:reverse
          bitmap.width  = bitmap.pixels.size
          bitmap.height = bitmap.pixels[0].size
        end
      
    end
  end
end
