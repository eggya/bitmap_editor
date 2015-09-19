module BitmapEditor
  module Tool
    class I < Base

      # initialize
      # assign additional vars
      def initialize bitmap,params
        super
        @x_axis = params[0].to_i
        @y_axis = params[1].to_i
      end

      # returns [Boolean] True when validation passed
      def validated?
        params.count == 2
      end

      # returns [Boolean] True when succesfully performed
      def perform!
        return unless validated?

        bitmap.width  = @x_axis
        bitmap.height = @y_axis
        bitmap.pixels = bitmap.generate_pixels
      end

    end
  end
end
