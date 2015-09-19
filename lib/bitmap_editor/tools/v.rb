module BitmapEditor
  module Tool
    class V < Base

      # initialize
      # assign additional vars
      def initialize bitmap,params
        super
        @x_axis   = params[0].to_i
        @y_axis_1 = params[1].to_i
        @y_axis_2 = params[2].to_i
        @colour   = params[3].to_s
      end

      # returns [Boolean] True when validation passed
      def validated?
        valid_params? && valid_colour? && valid_dimension?
      end

      # returns [Boolean] True when succesfully performed
      def perform!
        return unless validated?
        [@y_axis_1,@y_axis_2].each {|i| bitmap.pixels[i][@x_axis-1] = @colour }
      end

      protected

        def valid_params?
          params.count == 4
        end

        def valid_colour?
          !@colour.match(/^[A-Z]$/).nil?
        end

        def valid_dimension?
          @x_axis <= bitmap.width && @y_axis_1 <= bitmap.height && @y_axis_2 <= bitmap.height
        end
      
    end
  end
end
