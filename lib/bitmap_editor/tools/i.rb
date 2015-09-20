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
        valid_params? && valid_dimension?
      end

      # returns [Boolean] True when succesfully performed
      def perform!
        return unless validated?

        bitmap.width  = @x_axis
        bitmap.height = @y_axis
        bitmap.pixels = bitmap.generate_pixels
      end

      protected

        def valid_params?
          params.count == 2
        end

        def valid_dimension?
          [@x_axis,@y_axis].all? {|num| num > 0 && num <= 250 }
        end

    end
  end
end
