module BitmapEditor
  module Tool
    class L < Base

      # initialize
      # assign additional vars
      def initialize bitmap,params
        super
        @x_axis = params[0].to_i
        @y_axis = params[1].to_i
        @colour = params[2].to_s
      end

      # returns [Boolean] True when validation passed
      def validate
        validate_params
        validate_coordinates
        validate_colour
        validate_dimension
      end

      protected

        def perform
          bitmap.pixels[@y_axis-1][@x_axis-1] = @colour
        end

        def validate_params
          fail ParamsValidationError.new(params.count,3) unless params.count == 3
        end

        def validate_coordinates
          fail CoordinateValidationError.new unless [@x_axis, @y_axis].all? {|num| num.between? 1,250 }
        end

        def validate_dimension
          fail DimensionValidationError.new(bitmap.width, bitmap.height) unless
            @x_axis <= bitmap.width && @y_axis <= bitmap.height
        end

    end
  end
end
