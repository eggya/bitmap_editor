require 'spec_helper'

describe BitmapEditor::Tool::R do

  let(:params) { [] }
  let(:bitmap) { BitmapEditor::Bitmap.new 3,3 }
  before { bitmap.pixels = [[0,0,0],["F","F","F"],["C","C","C"]] }

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::R.perform! bitmap,params }

    it "should return true as default" do
      expect( subject ).to match_array [["C","F",0],["C","F",0],["C","F",0]]
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::R.new bitmap,params }
    it { is_expected.to be_instance_of BitmapEditor::Tool::R }

    describe "#Validated?" do
      it "should return false in base class" do
        expect( subject.validated? ).to be true
      end
    end

    describe "#Perform!" do
      it "should return false in base class" do
        expect( subject.perform! ).to match_array [["C","F",0],["C","F",0],["C","F",0]]
      end
    end

  end

end
