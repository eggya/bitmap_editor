module BitmapEditor
  module Tool
    class F < Base

      # initialize
      # assign additional vars
      def initialize bitmap,params
        super
        @x_axis = params[0].to_i
        @y_axis = params[1].to_i
        @colour = params[2].to_s
        @old_colour = bitmap.pixels[@y_axis-1][@x_axis-1]
      end

      # returns [Boolean] True when validation passed
      def validate
        validate_params
        validate_colour
        validate_dimension
      end

      protected

        def perform
          bitmap.pixels.each do |row|
            row.map! {|col| col == @old_colour ? col = @colour : col }
          end
        end

        def validate_params
          fail ParamsValidationError.new(params.count,3) unless params.count == 3
        end

        def validate_colour
          fail ValidationError.new("colours are specified by single capital letter") if @colour.match(/^[A-Z]$/).nil?
        end

        def validate_dimension
          fail ValidationError.new("maximum size is #{bitmap.width}x#{bitmap.height}") unless @x_axis <= bitmap.width && @y_axis <= bitmap.height
        end

    end
  end
end
