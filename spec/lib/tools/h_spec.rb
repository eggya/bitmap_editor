require 'spec_helper'

describe BitmapEditor::Tool::H do

  let(:params) { [1,3,3,"C"] }
  let(:bitmap) { BitmapEditor::Bitmap.new 4,4 }

  before do
    bitmap.generate_pixels
    bitmap.pixels[2][0] = "F"
  end

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::H.perform! bitmap,params }

    it "should change pixels value on perform" do
      expect{ subject }.to change{ bitmap.pixels[2][0] }.from("F").to("C")
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::H.new bitmap,params }
    it { is_expected.to be_instance_of BitmapEditor::Tool::H }

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

      context "validates dimension" do
        let(:params) { [6,2,1,"C"] }

        it "should raise error when coordinates are bigger than canvass" do
          expect{ subject.validate }.to raise_error BitmapEditor::ValidationError
        end
      end

      context "passing validation" do
        it "should not raise any errors when validation satisfied" do
          expect( subject.validate ).to be_nil
        end
      end
    end

    describe "#Perform!" do
      it "should change pixels value on perform" do
        expect{ subject.perform! }.to change{ bitmap.pixels[2][0] }.from("F").to("C")
      end
    end

  end

end
