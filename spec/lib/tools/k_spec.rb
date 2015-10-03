require 'spec_helper'

describe BitmapEditor::Tool::K do

  let(:params) { [3,2,6,5,"C"] }
  let(:bitmap) { BitmapEditor::Bitmap.new 6,6 }

  before do
    bitmap.generate_pixels
  end

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::K.perform! bitmap,params }

    it "should change pixels value on perform" do
      expect{ subject }.to change{ [bitmap.pixels[1][2],bitmap.pixels[4][5]] }.from(["O","O"]).to(["C","C"])
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::K.new bitmap,params }
    it { is_expected.to be_instance_of BitmapEditor::Tool::K }

    describe "#Validate" do

      context "validates too many params" do
        let(:params) { [1,2,"C",3,4,5] }

        it "should raise error when too many parameters" do
          expect{ subject.validate }.to raise_error BitmapEditor::ParamsValidationError
        end
      end

      context "validates too few params" do
        let(:params) { [1,2,"C"] }

        it "should raise error when not enough parameters" do
          expect{ subject.validate }.to raise_error BitmapEditor::ParamsValidationError
        end
      end

      context "validates colour" do
        let(:params) { [1,2,3,4,5] }

        it "should raise error when not correct format of colour" do
          expect{ subject.validate }.to raise_error BitmapEditor::ValidationError
        end
      end

      context "validates coordinates" do
        let(:params) { [1,1,0,5,"C"] }

        it "should raise error when coordinates are not in range 1 to 250" do
          expect{ subject.validate }.to raise_error BitmapEditor::CoordinateValidationError
        end
      end

      context "validates dimension" do
        let(:params) { [6,2,1,7,"C"] }

        it "should raise error when coordinates are bigger than canvass" do
          expect{ subject.validate }.to raise_error BitmapEditor::DimensionValidationError
        end
      end

      context "passing validation" do
        it "should not raise any errors when validation satisfied" do
          expect( subject.validate ).to be_nil
        end
      end
    end

  end

end
