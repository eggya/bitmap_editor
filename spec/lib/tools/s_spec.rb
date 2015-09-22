require 'spec_helper'

describe BitmapEditor::Tool::S do

  let(:params) { [] }
  let(:bitmap) { BitmapEditor::Bitmap.new 3,3 }
  before { bitmap.generate_pixels }

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::S.perform! bitmap,params }

    it "should return array as result" do
      expect( subject ).to eq "OOO\nOOO\nOOO\n"
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::S.new bitmap,params }
    it { is_expected.to be_instance_of BitmapEditor::Tool::S }

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
