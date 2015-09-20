module BitmapEditor
  module Tool
    class Base

      attr_reader :bitmap, :params

      # returns [Array] of the class' descendants names
      def self.descendants
        @descendants ||= ObjectSpace.each_object(Class).select { |klass| klass < self }.map { |klass| klass.name.split('::').last }
      end

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
