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
        end
      
    end
  end
end
