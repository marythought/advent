require "spec_helper"
require "10.rb"

describe "10" do
	test_input = []
	input = IO.read("inputs/10.txt").split("\n")

	it "returns accurate test data" do
		assert_equal nil, part_1_10(test_input)
		assert_equal nil, part_2_10(test_input)
	end

	it "returns a valid result" do
		assert_equal nil, part_1_10(input)
		assert_equal nil, part_2_10(input)
	end
end
