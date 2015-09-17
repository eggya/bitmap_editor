require 'spec_helper'

describe BitmapEditor::App do

  #### Class Methods

  describe "Run!" do

    context "on user's exit command" do
      before  { allow(Readline).to receive(:readline).with("> ", true).and_return("X") }
      subject { BitmapEditor::App.run! }

      it "should exit the system on hitting X command" do
        expect { subject; exit }.to raise_error SystemExit
      end
    end

    context "on exitting by SIGINT" do
      before  { allow(Readline).to receive(:readline).with("> ", true).and_raise(Interrupt) }
      subject { BitmapEditor::App.run! }

      it "should exit the system on interrupt event" do
        expect { subject; exit }.to raise_error SystemExit
      end
    end    
  end

  #### Instance Methods

  describe "Initialize" do
    subject { BitmapEditor::App.new }
    it { is_expected.to be_instance_of(BitmapEditor::App) }
  end

end
