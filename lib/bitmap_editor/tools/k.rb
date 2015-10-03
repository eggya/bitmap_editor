module BitmapEditor
  module Tool
    class K < Base

      # initialize
      # assign additional vars
      def initialize bitmap,params
        super
        @x_axis_1 = params[0].to_i
        @y_axis_1 = params[1].to_i
        @x_axis_2 = params[2].to_i
        @y_axis_2 = params[3].to_i
        @colour   = params[4].to_s
      end

      # returns [Boolean] True when validation passed
      def validate
        validate_params
        validate_colour
        validate_coordinates
        validate_dimension
      end

      protected

        def validate_params
          fail ParamsValidationError.new(params.count,5) unless params.count == 5
        end

        def validate_colour
          fail ValidationError.new("colours are specified by single capital letter") if @colour.match(/^[A-Z]$/).nil?
        end

        def validate_coordinates
          fail CoordinateValidationError.new unless [@y_axis_1, @y_axis_2, @x_axis_1, @x_axis_2].all? {|num| num.between? 1,250 }
        end

        def validate_dimension
          fail DimensionValidationError.new(bitmap.width, bitmap.height) unless
            @x_axis_1 <= bitmap.width && @x_axis_2 <= bitmap.width && @y_axis_1 <= bitmap.height && @y_axis_2 <= bitmap.height
        end

        def perform
          draw_horizontal @x_axis_1,@x_axis_2,@y_axis_1
          draw_vertical @x_axis_1,@y_axis_1,@y_axis_2
          draw_vertical @x_axis_2,@y_axis_1,@y_axis_2
          draw_horizontal @x_axis_1,@x_axis_2,@y_axis_2
        end

        def draw_horizontal x1,x2,y
          min,max = [x1, x2].sort
          (min..max).to_a.each {|i| bitmap.pixels[y-1][i-1] = @colour }
        end

        def draw_vertical x,y1,y2
          min,max = [y1, y2].sort
          (min..max).to_a.each {|i| bitmap.pixels[i-1][x-1] = @colour }
        end

    end
  end
end
