require 'spec_helper'

describe BitmapEditor::Command do

  #### Class Methods

  describe "#Execute" do

    context "case of invalid command" do
      subject { BitmapEditor::Command.execute ["bogus"] }

      it "should throw warn message on unregistered command" do
        expect { subject }.to raise_error BitmapEditor::InvalidCommand
      end
    end

    context "case of valid command" do
      subject { BitmapEditor::Command.execute ["S"] }
      it { is_expected.to be_instance_of BitmapEditor::Command }
    end

  end

end
