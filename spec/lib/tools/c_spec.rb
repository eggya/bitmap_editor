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
      expect( subject ).to eq([["O","O","O"],["O","O","O"],["O","O","O"]])
    end
  end

  #### INSTANCE METHODS

  context "Instance methods" do
    subject { BitmapEditor::Tool::C.new bitmap,params }    
    it { is_expected.to be_instance_of BitmapEditor::Tool::C }

    describe "#Validate" do
      context "too many parameters" do
        let(:params) {[ "P","F" ]}

        it "should raise error when params is not in valid count" do
          expect{ subject.validate }.to raise_error BitmapEditor::ParamsValidationError
        end
      end

      context "passing validation" do
        it "should not raise error when params is valid count" do
          expect( subject.validate ).to be_nil
        end
      end
    end

    describe "#Perform!" do
      subject { BitmapEditor::Tool::C.new bitmap,params }

      it "should return hash of arrays of cleared bitmap" do
        expect( subject.perform! ).to be_a Array
        expect( subject.perform! ).to eq([["O","O","O"],["O","O","O"],["O","O","O"]])
      end
    end

  end

end
