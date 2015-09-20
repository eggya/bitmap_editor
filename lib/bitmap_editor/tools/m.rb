module BitmapEditor
  module Tool
    class M < Base

      # returns [Boolean] True when validation passed
      def validate
        fail ParamsValidationError.new(params.count,0) unless params.empty?
      end

      protected

        def perform
          bitmap.pixels = @bitmap.pixels.map(&:reverse)
        end
      
    end
  end
end
