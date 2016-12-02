require "spec_helper"
require "3.rb"

describe '3' do
  input = IO.read("inputs/3.txt").chomp!

  it "returns a valid result" do
    assert_equal 2592, deliver_presents(input)
    assert_equal 2360, robo_santa(input)
  end
end
