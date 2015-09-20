require 'spec_helper'

describe BitmapEditor::Tool::C do

  let(:params) { [] }
  let(:bitmap) { BitmapEditor::Bitmap.new 3,3 }
  before { bitmap.generate_pixels }

  #### CLASS METHODS

  describe "#Perform!" do
    subject { BitmapEditor::Tool::C.perform! bitmap,params }

    it "should return hash of arrays of cleared bitmap" do
      expect( subject ).to be_a Array
      expect( subject ).to eq([[0,0,0],[0,0,0],[0,0,0]])
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::C.new bitmap,params }    
    it { is_expected.to be_instance_of BitmapEditor::Tool::C }

    describe "#Validated?" do
      context "too many parameters" do
        let(:params) {[ "P","F" ]}

        it "should return false when params is not in valid count" do
          expect( subject.validated? ).to be false
        end
      end

      context "passing validation" do
        it "should return true when params is valid count" do
          expect( subject.validated? ).to be true
        end
      end
    end

    describe "#Perform!" do
      subject { BitmapEditor::Tool::C.new bitmap,params }

      it "should return hash of arrays of cleared bitmap" do
        expect( subject.perform! ).to be_a Array
        expect( subject.perform! ).to eq([[0,0,0],[0,0,0],[0,0,0]])
      end
    end

  end

end
