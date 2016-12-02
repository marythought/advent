require "spec_helper"
require "5.rb"

describe '5' do
  input = IO.read("inputs/5.txt").chomp!

  it "returns a valid result" do
    assert_equal 258, nice_strings(input)
    assert_equal 53, nicer_strings(input)
  end
end
