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
        
        bitmap.pixels.each do |row,pixel|
          pixel.map! {|col| col = 0 }
        end
      end
      
    end
  end
end
