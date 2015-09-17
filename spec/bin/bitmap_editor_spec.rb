require 'spec_helper'

describe 'bitmap editor command' do

  before  { allow(Readline).to receive(:readline).with("> ",true) }
  subject { BitmapEditor::App.run! }

  it "should run and initiated bitmap editor" do
    expect( subject ).to_not be false
  end
end
