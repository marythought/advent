require "spec_helper"
require "2.rb"

describe '2' do
  input = IO.read("inputs/2.txt").split("\n")

  it "returns a valid result" do
    assert_equal "69642", bathroom_code(input)
    assert_equal "8CB23", new_bathroom_code(input)
  end
end
