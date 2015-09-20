require 'spec_helper'

describe BitmapEditor::Tool::I do

  let(:params) { [3,4] }
  let(:bitmap) { BitmapEditor::Bitmap.new }
  let(:new_bitmap) {[[0,0,0],[0,0,0],[0,0,0],[0,0,0]]}

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::I.perform! bitmap,params }

    it "should return hash of arrays of the bitmap" do
      expect{ subject }.to change{ [bitmap.width, bitmap.height, bitmap.pixels] }.to([3,4,new_bitmap])
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::I.new bitmap,params }
    it { is_expected.to be_instance_of BitmapEditor::Tool::I }

    describe "#Validated?" do

      context "too many parameters" do
        let(:params) { [1,2,3] }
        it "should return false in non valid count of parameters" do
          expect( subject.validated? ).to be false
        end
      end

      context "surpased max canvass size" do
        let(:params) { [251,23] }
        it "should return false in oversized bitmaps" do
          expect( subject.validated? ).to be false
        end
      end

      context "passing validation" do
        it "should return false in valid count of parameters" do
          expect( subject.validated? ).to be true
        end
      end
    end

    describe "#Perform!" do
      it "should return hash of arrays of the bitmap" do
        expect( subject.perform! ).to be_a Array
      end
    end

  end

end
