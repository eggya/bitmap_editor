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
      def validated?
        valid_params? && valid_colour? && valid_dimension?
      end

      # returns [Boolean] True when succesfully performed
      def perform!
        return unless validated?
        [@x_axis_1,@x_axis_2].each {|i| bitmap.pixels[@y_axis-1][i-1] = @colour }
      end

      protected

        def valid_params?
          params.count == 4
        end

        def valid_colour?
          !@colour.match(/^[A-Z]$/).nil?
        end

        def valid_dimension?
          @x_axis_1 <= bitmap.width && @x_axis_2 <= bitmap.width && @y_axis <= bitmap.height
        end

    end
  end
end
