require "spec_helper"
require "7.rb"

describe '7' do
  input = IO.read("inputs/7.txt").chomp!
  lines = clean(input)
  toy = Toy.new

  it "returns a valid result for first part" do
    toy.parse_inputs(lines)
    assert_equal 3176, toy.find_value("a")
  end

  it "returns a valid result for second part" do
    old_a = 3176
    toy.reset
    toy.parse_inputs(lines)
    toy.wires["b"] = old_a
    assert_equal 14710, toy.find_value("a")
  end
end
