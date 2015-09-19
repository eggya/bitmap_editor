module BitmapEditor
  module Tool
    class S < Base

      # returns [Boolean] True when validation passed
      def validated?
        params.empty?
      end

      # returns [Boolean] True when succesfully performed
      def perform!
        return unless validated? || bitmap.dimension.zero?
        bitmap.pixels.values.inject("") {|str,row| str = str.to_s + (row.join + "\n") ; printf str } 
        true
      end
      
    end
  end
end
