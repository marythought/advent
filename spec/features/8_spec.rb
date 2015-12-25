require "spec_helper"
require "8.rb"

describe '8' do
  input = IO.readlines("inputs/8.txt")

  it "returns a valid result for first part" do
    assert_equal find_difference(input), 1333
  end

  it "returns a valid result for second part" do
    skip
    assert_equal encode(input), 0
  end
end
