module BitmapEditor
  module Tool
    class R < Base

      def initialize bitmap,params
        super
        @width = bitmap.width
        @height = bitmap.height
      end

      # returns [Boolean] True when validation passed
      def validate
        fail ParamsValidationError.new(params.count,0) unless params.empty?
      end

      protected

        def perform
          bitmap.width  = @height
          bitmap.height = @width
          bitmap.pixels = @bitmap.pixels.transpose.map(&:reverse)
        end
      
    end
  end
end
