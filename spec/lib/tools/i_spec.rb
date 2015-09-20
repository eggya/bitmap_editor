require 'spec_helper'

describe BitmapEditor::Tool::I do

  let(:params) { [3,4] }
  let(:bitmap) { BitmapEditor::Bitmap.new }
  let(:new_bitmap) {[["O","O","O"],["O","O","O"],["O","O","O"],["O","O","O"]]}

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::I.perform! bitmap,params }

    it "should change pixels value upon perform" do
      expect{ subject }.to change{ [bitmap.width, bitmap.height, bitmap.pixels] }.to([3,4,new_bitmap])
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::I.new bitmap,params }
    it { is_expected.to be_instance_of BitmapEditor::Tool::I }

    describe "#Validate" do

      context "validates too many params" do
        let(:params) { [1,2,3] }

        it "should return raise error when too many parameters" do
          expect{ subject.validate }.to raise_error BitmapEditor::ParamsValidationError
        end
      end

      context "validates too few params" do
        let(:params) { [1] }
        
        it "should return raise error when not enough parameters" do
          expect{ subject.validate }.to raise_error BitmapEditor::ParamsValidationError
        end
      end

      context "validates dimension" do
        let(:params) { [251,251] }

        it "should raise error when exceed max allowed size" do
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
      it "should return hash of arrays of the bitmap" do
        expect( subject.perform! ).to be_a Array
      end
    end

  end

end
