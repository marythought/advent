require "spec_helper"
require "8.rb"

describe "8" do
	test_input = []
	input = IO.read("inputs/8.txt").split("\n")

	it "returns accurate test data" do
		assert_equal nil, part_1_8(test_input)
		assert_equal nil, part_2_8(test_input)
	end

	it "returns a valid result" do
		assert_equal nil, part_1_8(input)
		assert_equal nil, part_2_8(input)
	end
end
