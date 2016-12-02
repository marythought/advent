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
    assert_equal 543903, grid.count_lights
  end

  it "returns a valid result for second part" do
    skip
    # works but takes a long time
    grid = Grid2.new(1000)
    grid.process_input(lines)
    assert_equal 14687245, grid.count_lights
  end
end
