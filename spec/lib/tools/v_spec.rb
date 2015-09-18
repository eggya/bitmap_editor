require 'spec_helper'

describe BitmapEditor::Tool::V do

  let(:params) { ["X","Y1","Y2","C"] }

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::Base.perform! params }

    it "should return false as default" do
      expect( subject ).to be false
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::Base.new params }
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
