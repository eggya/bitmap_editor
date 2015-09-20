module BitmapEditor
  module Tool
    class C < Base

      # returns [Boolean] True when validation passed
      def validated?
        params.empty?
      end

      # returns [Boolean] True when succesfully performed
      def perform!
        return unless validated?
        bitmap.pixels.each {|col| col.fill(0) }
      end
      
    end
  end
end
