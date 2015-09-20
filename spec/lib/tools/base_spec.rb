require 'spec_helper'

describe BitmapEditor::Tool::Base do

  let(:params) { ["M","N"] }
  let(:bitmap) { BitmapEditor::Bitmap.new }

  #### CLASS METHODS

  describe "#Descendants" do
    subject { BitmapEditor::Tool::Base.descendants }

    it "should return a list of descendants names" do
      expect( subject ).to match_array ["I","L","C","V","H","F","S","R","M"]
    end
  end

  describe "#Perform!" do
    subject { BitmapEditor::Tool::Base.perform! bitmap,params }

    it "should fail validation as default" do
      expect{ subject }.to raise_error BitmapEditor::ValidationError
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::Base.new bitmap,params }
    it { is_expected.to be_instance_of BitmapEditor::Tool::Base }

    describe "#Validate" do
      it "should raise error as default" do
        expect{ subject.validate }.to raise_error BitmapEditor::ValidationError
      end
    end

    describe "#Perform!" do
      it "should fail validation as default" do
        expect{ subject.perform! }.to raise_error BitmapEditor::ValidationError
      end
    end

    describe "#Perform" do
      it "should return false as default" do
        expect( subject.send :perform ).to eq false
      end
    end

  end

end
