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
      def validate
        validate_params
        validate_dimension
      end

      protected

        def perform
          bitmap.width  = @x_axis
          bitmap.height = @y_axis
          bitmap.pixels = bitmap.generate_pixels
        end

        def validate_params
          fail ParamsValidationError.new(params.count,2) unless params.count == 2
        end

        def validate_dimension
          fail ValidationError.new("accepted range is between 1 and 250") unless [@x_axis,@y_axis].all? {|num| num > 0 && num <= 250 }
        end

    end
  end
end
