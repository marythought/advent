require "spec_helper"
require "1.rb"

describe '1' do
  input = IO.read("inputs/1.txt").chomp!

  it "returns a valid result" do
    assert_equal 74, count_floors(input)
    assert_equal 1795, basement_entry(input)
  end
end
