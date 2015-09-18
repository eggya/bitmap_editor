module BitmapEditor
  module Tool
    class I < Base

      # returns [Boolean] True when validation passed
      def validated?
        false
      end

      # returns [Boolean] True when succesfully performed
      def perform!
        false
      end
      
    end
  end
end
