require "spec_helper"
require "1.rb"

describe '1' do
  input = IO.read("inputs/1.txt").delete(",").split

  it "returns a valid result" do
    assert_equal 236, find_HQ(input)
    assert_equal 182, find_double_visited(input)
  end
end
