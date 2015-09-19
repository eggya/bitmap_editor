require 'spec_helper'

describe BitmapEditor::Tool::S do

  let(:params) { [] }
  let(:bitmap) { BitmapEditor::Bitmap.new 3,3 }
  before { bitmap.generate_pixels }

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::S.perform! bitmap,params }

    it "should return true as default" do
      expect( subject ).to be true
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::S.new bitmap,params }
    it { is_expected.to be_instance_of BitmapEditor::Tool::S }

    describe "#Validated?" do
      it "should return false in base class" do
        expect( subject.validated? ).to be true
      end
    end

    describe "#Perform!" do
      it "should return false in base class" do
        expect( subject.perform! ).to be true
      end
    end

  end

end
