require "spec_helper"
require "3.rb"

describe '3' do
  input = IO.read("inputs/3.txt").split("\n")

  it "returns a valid result" do
    assert_equal 1050, valid_triangles(input)
    assert_equal 1921, vertical_triangles(input)
  end
end
