require "spec_helper"
require "14.rb"

describe '14' do
  input = IO.readlines("inputs/14.txt")

  it "returns a valid result for first part" do
    race = Race.new(2503, input)
    assert_equal 2696, race.run_race
  end

  it "returns a valid result for second part" do
    race = Race.new(2503, input)
    assert_equal 1084, race.run_race_with_points
  end
end
