require "spec_helper"
require "8.rb"

describe '8' do
  input = IO.readlines("inputs/8.txt")

  it "returns a valid result for first part" do
    assert_equal 1333, find_difference(input)
  end

  it "returns a valid result for second part" do
    skip
    assert_equal 0, encode(input),
  end
end
