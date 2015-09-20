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
      end

      # returns [Boolean] True when validation passed
      def validate
        validate_params
        validate_colour
        validate_dimension
      end

      protected

        def perform
          original_colour = bitmap.pixels[@y_axis-1][@x_axis-1]

          bitmap.pixels.each do |row|
            row.map! {|col| col == original_colour ? col = @colour : col }
          end
        end

        def validate_params
          fail ParamsValidationError.new(params.count,3) unless params.count == 3
        end

        def validate_colour
          fail ValidationError.new("colours are specified by single capital letter") if @colour.match(/^[A-Z]$/).nil?
        end

        def validate_dimension
          valid_range = [@x_axis,@y_axis].all? {|num| num.between? 0,250 }
          valid_dimension = @x_axis <= bitmap.width && @y_axis <= bitmap.height
          fail DimensionValidationError.new(bitmap.width,bitmap.height) unless valid_range && valid_dimension
        end

    end
  end
end
