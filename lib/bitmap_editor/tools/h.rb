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
        validate_colour
        validate_dimension
      end

      protected

        def perform
          [@x_axis_1,@x_axis_2].each {|i| bitmap.pixels[@y_axis-1][i-1] = @colour }
        end

        def validate_params
          fail ParamsValidationError.new(params.count,4) unless params.count == 4
        end

        def validate_colour
          fail ValidationError.new("colours are specified by single capital letter") if @colour.match(/^[A-Z]$/).nil?
        end

        def validate_dimension
          fail ValidationError.new("maximum size is 250x250") unless 
            @x_axis_1 <= bitmap.width && @x_axis_2 <= bitmap.width && @y_axis <= bitmap.height
        end
    end
  end
end
