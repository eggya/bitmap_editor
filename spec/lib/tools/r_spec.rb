require 'spec_helper'

describe BitmapEditor::Tool::R do

  let(:params) { [] }
  let(:bitmap) { BitmapEditor::Bitmap.new 4,3 }
  before { bitmap.pixels = [["O","O","O"],["F","F","F"],["C","C","C"],["T","T","T"]] }

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::R.perform! bitmap,params }

    it "should return transposed array as a result" do
      expect{ subject }.to change { bitmap.pixels }.to [["T","C","F","O"],["T","C","F","O"],["T","C","F","O"]]
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::R.new bitmap,params }
    it { is_expected.to be_instance_of BitmapEditor::Tool::R }

    describe "#Validate" do
      context "validates too many params" do
        let(:params) { [1] }

        it "should return raise error when too many parameters" do
          expect{ subject.validate }.to raise_error BitmapEditor::ParamsValidationError
        end
      end

      context "passing validation" do
        it "should not raise any errors when validation satisfied" do
          expect( subject.validate ).to be_nil
        end
      end
    end

    describe "#Perform!" do
      it "should change the bitmap width and height" do
        expect{ subject.perform! }.to change { [bitmap.width, bitmap.height] }.from([4,3]).to([3,4])
      end

      it "should return transposed array as a result" do
        expect{ subject.perform! }.to change { bitmap.pixels }.to [["T","C","F","O"],["T","C","F","O"],["T","C","F","O"]]
      end
    end

  end

end
