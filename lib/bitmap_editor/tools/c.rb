module BitmapEditor
  module Tool
    class C < Base

      # returns [Boolean] True when validation passed
      def validate
        return super unless params.empty?
      end

      protected
        
        def perform
          bitmap.pixels.each {|col| col.fill(0) }
        end
      
    end
  end
end
