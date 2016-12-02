require "spec_helper"
require "12.rb"

describe '12' do
  input = IO.read("inputs/12.txt")

  it "returns a valid result for first part" do
    # works but takes a long time to get a result
    assert_equal 191164, find_numbers(input)
  end

  it "returns a valid result for second part" do
    skip
    assert_equal 0, find_non_red_numbers(input)
  end
end
