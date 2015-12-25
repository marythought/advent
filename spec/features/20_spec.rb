require "spec_helper"
require "20.rb"

describe '20' do
  input = 36000000
  santa = Santa.new(input)

  it "returns a valid result for first part" do
    assert_equal 0, santa.find_lowest
  end

  it "returns a valid result for second part" do
    skip
    assert_equal input, 36000000
  end
end
