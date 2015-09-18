require 'spec_helper'

describe BitmapEditor::Error do
  it { is_expected.to be_a(StandardError) }
end

describe BitmapEditor::ValidationError do
  subject { BitmapEditor::ValidationError.new }
  it { is_expected.to be_a(BitmapEditor::ValidationError) }

  it "should return a particular error message" do
    expect( subject.message ).to include("Validation error")
  end
end

describe BitmapEditor::InvalidCommand do
  subject { BitmapEditor::InvalidCommand.new ["I"] }
  it { is_expected.to be_a(BitmapEditor::InvalidCommand) }

  it "should return a particular error message" do
    expect( subject.message ).to include("Invalid command: I")
  end
end
