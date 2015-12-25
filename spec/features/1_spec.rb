require "spec_helper"
require "1.rb"

describe '1' do
  input = IO.read("inputs/1.txt").chomp!
  
  it "returns a valid result" do
    assert_equal count_floors(input), 74
    assert_equal basement_entry(input), 1795
  end
end
