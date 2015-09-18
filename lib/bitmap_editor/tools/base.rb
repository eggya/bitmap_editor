module BitmapEditor
  module Tool
    class Base

      # returns [Boolean] true when performed
      def self.perform! params
        new(params).perform!
      end

      # initialize with params
      def initialize params
        @params = params
        perform! if validated?    
      end

      # abstract
      # returns [Boolean] True when validation passed
      def validated?
        false
      end

      # abstract
      # returns [Boolean] True when succesfully performed
      def perform!
        false
      end
      
    end
  end
end
