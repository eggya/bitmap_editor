require 'spec_helper'

describe BitmapEditor::Command do

  #### Class Methods

  describe "#Execute" do
    subject { BitmapEditor::Command.execute "I" }

    it "should exit the system on interrupt event" do
      pending("unimplemented")
      fail
    end
  end

end
