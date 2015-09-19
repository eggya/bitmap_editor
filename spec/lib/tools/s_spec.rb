require 'spec_helper'

describe BitmapEditor::Tool::S do

  let(:params) { [] }
  let(:bitmap) { BitmapEditor::Bitmap.new }

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::Base.perform! bitmap,params }

    it "should return false as default" do
      expect( subject ).to be false
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::Base.new bitmap,params }
    it { is_expected.to be_instance_of BitmapEditor::Tool::Base }

    describe "#Validated?" do
      it "should return false in base class" do
        expect( subject.validated? ).to be false
      end
    end

    describe "#Perform!" do
      it "should return false in base class" do
        expect( subject.perform! ).to be false
      end
    end

  end

end
