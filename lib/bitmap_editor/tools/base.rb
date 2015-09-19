module BitmapEditor
  module Tool
    class Base

      attr_reader :bitmap, :params

      # returns [Boolean] true when performed
      def self.perform! bitmap,params
        new(bitmap,params).perform!
      end

      # initialize with params
      def initialize bitmap,params
        @params = params
        @bitmap = bitmap
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
