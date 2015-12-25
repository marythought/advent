require "spec_helper"
require "3.rb"

describe '3' do
  input = IO.read("inputs/3.txt").chomp!

  it "returns a valid result" do
    assert_equal deliver_presents(input), 2592
    assert_equal robo_santa(input), 2360
  end
end
