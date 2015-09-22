module BitmapEditor
  module Tool
    class F < Base

      # initialize
      # assign additional vars
      def initialize bitmap,params
        super
        @x_axis = params[0].to_i-1
        @y_axis = params[1].to_i-1
        @colour = params[2].to_s
        @original_colour = @bitmap.pixels[@y_axis][@x_axis]
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
          fill_region bitmap,@x_axis,@y_axis
        end

        def fill_region bitmap,x_axis,y_axis
          return unless valid_dimension?(x_axis,y_axis) && bitmap.pixels[x_axis][y_axis] == @original_colour
          bitmap.pixels[x_axis][y_axis] = @colour
          
          [[1,0],[-1,0],[0,1],[0,-1]].each {|x,y| fill_region bitmap, x_axis+x, y_axis+y }
        end

        def valid_dimension? x_axis,y_axis
          x_axis < bitmap.width && y_axis < bitmap.height
        end

        def validate_params
          fail ParamsValidationError.new(params.count,3) unless params.count == 3
        end

        def validate_coordinates
          fail CoordinateValidationError.new unless [@x_axis, @y_axis].all? {|num| num.between? 0,250 }
        end

        def validate_colour
          fail ValidationError.new("colours are specified by single capital letter") if @colour.match(/^[A-Z]$/).nil?
        end

        def validate_dimension
          fail DimensionValidationError.new(bitmap.width, bitmap.height) unless valid_dimension? @x_axis,@y_axis
        end

    end
  end
end
