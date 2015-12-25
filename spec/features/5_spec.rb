require "spec_helper"
require "5.rb"

describe '5' do
  input = IO.read("inputs/5.txt").chomp!

  it "returns a valid result" do
    assert_equal nice_strings(input), 258
    assert_equal nicer_strings(input), 53
  end
end
