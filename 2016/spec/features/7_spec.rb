require "spec_helper"
require "7.rb"

describe "7" do
	test_input = ["abba[mnop]qrst", "abcd[bddb]xyyx", "abcd[abcfgh]xyyx", "xyyx[bddb]abcd", "aaaa[qwer]tyui", "ioxxoj[asdfgh]zxcvbn"]
	test_input_2 = ["aba[bab]xyz", "xyx[xyx]xyx", "aaa[kek]eke", "zazbz[bzb]cdb", "zazbz[bbb]bbb"]
	input = IO.read("inputs/7.txt").split("\n")

	it "returns accurate test data" do
		assert_equal 3, part_1_7(test_input)
		assert_equal 3, part_2_7(test_input_2)
	end

	it "returns a valid result" do
		assert_equal 115, part_1_7(input)
		assert_equal 231, part_2_7(input)
	end
end
