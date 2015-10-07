module BitmapEditor
  module Tool
    class H < Base

      # initialize
      # assign additional vars
      def initialize bitmap,params
        super
        @x_axis_1 = params[0].to_i
        @x_axis_2 = params[1].to_i
        @y_axis   = params[2].to_i
        @colour   = params[3].to_s
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
          min,max = [@x_axis_1, @x_axis_2].sort
          (min..max).to_a.each {|i| bitmap.pixels[@y_axis-1][i-1] = @colour }
        end

        def validate_params
          fail ParamsValidationError.new(params.count,4) unless params.count == 4
        end

        def validate_coordinates
          fail CoordinateValidationError.new unless [@y_axis, @x_axis_1, @x_axis_2].all? {|num| num.between? 1,250 }
        end

        def validate_dimension
          fail DimensionValidationError.new(bitmap.width, bitmap.height) unless
            @x_axis_1 <= bitmap.width && @x_axis_2 <= bitmap.width && @y_axis <= bitmap.height
        end
    end
  end
end
