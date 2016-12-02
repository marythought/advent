require "spec_helper"
require "16.rb"

describe '16' do

  it "returns a valid result for first part" do
    input = IO.readlines("inputs/16.txt")
    input = clean16(input)
    assert_equal 103, process_sues(input)
  end

  it "returns a valid result for second part" do
    input = IO.readlines("inputs/16.txt")
    input = clean16(input)
    assert_equal 405, process_sues2(input)
  end
end
