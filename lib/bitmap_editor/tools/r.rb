module BitmapEditor
  module Tool
    class R < Base

      # returns [Boolean] True when validation passed
      def validated?
        params.empty?
      end

      # returns [Boolean] True when succesfully performed
      def perform!
        return unless validated? || bitmap.dimension.zero?
        bitmap.pixels = bitmap.pixels.transpose.map &:reverse
      end
      
    end
  end
end
