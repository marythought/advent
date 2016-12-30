require "spec_helper"
require "6.rb"

describe "6" do
	test_input = "eedadn\ndrvtee\neandsr\nraavrd\natevrs\ntsrnev\nsdttsa\nrasrtv\nnssdts\nntnada\nsvetve\ntesnvt\nvntsnd\nvrdear\ndvrsen\nenarar"

	input = IO.read("inputs/6.txt").split("\n")

	it "returns accurate test data" do
		assert_equal "easter", part_1_6(test_input.split("\n"))
		assert_equal "advent", part_2_6(test_input.split("\n"))
	end

	it "returns a valid result" do
		assert_equal "mlncjgdg", part_1_6(input)
		assert_equal "bipjaytb", part_2_6(input)
	end
end
