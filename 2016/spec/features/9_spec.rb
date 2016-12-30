require "spec_helper"
require "9.rb"

describe "9" do
	test_input = []
	input = IO.read("inputs/9.txt").chomp!

	it "returns accurate test data" do
		# assert_equal nil, part_1_9(test_input)
		assert_equal nil, part_2_9(test_input)
	end

	it "returns a valid result" do
		assert_equal 107035, part_1_9(input)
		# 107036 is too high
		#107034 is too low
		assert_equal nil, part_2_9(input)
	end
end
