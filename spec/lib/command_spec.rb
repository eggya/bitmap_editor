require 'spec_helper'

describe BitmapEditor::Command do

  let(:bitmap) { BitmapEditor::Bitmap.new }

  #### Class Methods

  describe "#Execute" do

    context "case of invalid command" do
      subject { BitmapEditor::Command.execute bitmap,["bogus"] }

      it "should throw warn message on unregistered command" do
        expect { subject }.to raise_error BitmapEditor::InvalidCommand
      end
    end

    context "case of valid command" do
      subject { BitmapEditor::Command.new bitmap,['I',3,4] }
      it { is_expected.to be_instance_of BitmapEditor::Command }
    end

  end

  #### Instance Methods

  describe "#Initialize" do
    subject { BitmapEditor::Command.new bitmap,['I',3,4] }
    it { is_expected.to be_instance_of BitmapEditor::Command }

    it "should assigns class variables" do
      expect( subject.key ).to eq 'I'
      expect( subject.params ).to be_a Array
      expect( subject.params ).to match [3,4]
    end
  end

  describe "#Execute!" do
    subject { BitmapEditor::Command.new(bitmap,['I']).execute! }

    it "should return bitmap editor error when failing validation" do
      expect{ subject }.to raise_error BitmapEditor::ParamsValidationError
    end
  end

end
