require 'spec_helper'

describe 'bitmap editor command' do
  it 'will print hello to screen' do
    expect(`ruby #{Dir.pwd}/bin/bitmap_editor`).to include 'hello'
  end
end
