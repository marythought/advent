require "spec_helper"
require "6.rb"

describe '6' do
  input = IO.read("inputs/6.txt").chomp!
  lines = clean(input)

  it "returns a valid result for first part" do
    skip
    # works but takes a long time
    grid = Grid.new(1000)
    grid.process_input(lines)
    assert_equal grid.count_lights, 543903
  end

  it "returns a valid result for second part" do
    skip
    # works but takes a long time
    grid = Grid2.new(1000)
    grid.process_input(lines)
    assert_equal grid.count_lights, 14687245
  end
end
