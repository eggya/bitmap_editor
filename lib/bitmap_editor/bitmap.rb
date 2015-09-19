module BitmapEditor
  class Bitmap
    
    attr_accessor :height, :width, :pixels
    attr_reader :dimension

    # Initialize
    def initialize width=0,height=0
      @width  = width
      @height = height
      @pixels = Hash.new
    end

    # returns [Integer] of the bitmap's dimension
    def dimension
      @dimension = width * height
    end

    # returns [Hash[Array]] represents pixels in each rows of the bitmap
    def generate_pixels
      @pixels = (1..@height).inject({}) {|res,row| res[row] = Array.new(@width) {0} ; res }
    end

  end
end
