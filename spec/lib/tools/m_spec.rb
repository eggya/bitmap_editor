require 'spec_helper'

describe BitmapEditor::Tool::M do

  let(:params) { [] }
  let(:bitmap) { BitmapEditor::Bitmap.new 3,3 }

  before do
    bitmap.pixels = [["O","O","T"],["O","O","Y"],["O","O","F"]]
  end

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::M.perform! bitmap,params }

    it "should return array as result" do
      expect( subject ).to match_array [["T","O","O"],["Y","O","O"],["F","O","O"]]
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::M.new bitmap,params }
    it { is_expected.to be_instance_of BitmapEditor::Tool::M }

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

  end

end
