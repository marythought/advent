require "spec_helper"
require "12.rb"

describe "12" do
	test_input = []
	input = IO.read("inputs/12.txt").split("\n")

	it "returns accurate test data" do
		# assert_equal nil, part_1_12(test_input)
		# assert_equal nil, part_2_12(test_input)
	end

	it "returns a valid result" do
		assert_equal 318020, part_1_12(input)
		assert_equal 9227674, part_2_12(IO.read("inputs/12.txt").split("\n"))
	end
end
