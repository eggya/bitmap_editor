require 'spec_helper'

describe BitmapEditor::Tool::L do

  let(:params) { [1,1,"C"] }
  let(:bitmap) { BitmapEditor::Bitmap.new 3,3 }
  before { bitmap.generate_pixels }

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::L.perform! bitmap,params }

    it "should return boolean as default" do
      expect{ subject }.to change{ bitmap.pixels[1][0] }.to "C"
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::L.new bitmap,params }
    it { is_expected.to be_instance_of BitmapEditor::Tool::L }

    describe "#Validated?" do

      context "validates params" do
        let(:params) { [1,2,"C",3] }

        it "should return false when too many parameters" do
          expect( subject.send :valid_params? ).to be false
          expect( subject.validated? ).to be false
        end
      end

      context "validates colour" do
        let(:params) { [1,2,3] }

        it "should return false when not correct format of colour" do
          expect( subject.send :valid_colour? ).to be false
          expect( subject.validated? ).to be false
        end
      end

      context "validates dimension" do
        let(:params) { [4,2,"C"] }

        it "should return false when coordinates are bigger than canvass" do
          expect( subject.send :valid_dimension? ).to be false
          expect( subject.validated? ).to be false
        end
      end

      context "passing validation" do
        it "should return true when validation satisfied" do
          expect( subject.validated? ).to be true
        end
      end
    end

    describe "#Perform!" do
      subject { BitmapEditor::Tool::L.perform! bitmap,params }

      it "should return false in base class" do
      expect{ subject }.to change{ bitmap.pixels[1][0] }.to "C"
      end
    end

  end

end
