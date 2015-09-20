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
      def validated?
        valid_params? && valid_colour? && valid_dimension?
      end

      # returns [Boolean] True when succesfully performed
      def perform!
        return unless validated?

        bitmap.pixels.each do |row|
          row.map! {|col| col == @old_colour ? col = @colour : col }
        end
      end

      protected

        def valid_params?
          params.count == 3
        end

        def valid_colour?
          !@colour.match(/^[A-Z]$/).nil?
        end

        def valid_dimension?
          @x_axis <= bitmap.width && @y_axis <= bitmap.height
        end

    end
  end
end
