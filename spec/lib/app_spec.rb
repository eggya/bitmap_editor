require 'spec_helper'

describe BitmapEditor::App do

  describe "#run!" do
    subject { BitmapEditor::App.run! }

    it "should return a nice hello message" do
      expect( subject ).to include 'hello'
    end
  end

end
