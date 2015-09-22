require 'spec_helper'

describe BitmapEditor::Tool::V do

  let(:params) { [1,2,3,"C"] }
  let(:bitmap) { BitmapEditor::Bitmap.new 3,3 }

  before do
    bitmap.generate_pixels
    bitmap.pixels[1].fill("F")
  end

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::V.perform! bitmap,params }

    it "should change pixels value on perform" do
      expect{ subject }.to change{ [bitmap.pixels[1][0],bitmap.pixels[2][0]] }.from(["F","O"]).to(["C","C"])
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::V.new bitmap,params }
    it { is_expected.to be_instance_of BitmapEditor::Tool::V }

    describe "#Validate" do

      context "validates too many params" do
        let(:params) { [1,2,"C",3,4] }

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
        let(:params) { [1,2,3,4] }

        it "should raise error when not correct format of colour" do
          expect{ subject.validate }.to raise_error BitmapEditor::ValidationError
        end
      end

      context "validates coordinates" do
        let(:params) { [1,1,0,"C"] }

        it "should raise error when coordinates are not in range 1 to 250" do
          expect{ subject.validate }.to raise_error BitmapEditor::CoordinateValidationError
        end
      end

      context "validates dimension" do
        let(:params) { [6,2,1,"C"] }

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
