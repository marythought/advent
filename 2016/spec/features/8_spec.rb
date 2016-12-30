require "spec_helper"
require "8.rb"

describe "8" do
	input = IO.read("inputs/8.txt").split("\n")

	it "returns a valid result" do
		assert_equal 110, part_1_8(input)
		# assert_equal nil, part_2_8(input)
	end
end
