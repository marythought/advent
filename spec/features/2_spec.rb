require "spec_helper"
require "2.rb"

describe '2' do
  input = IO.readlines("inputs/2.txt")

  it "returns a valid result" do
    assert_equal 1586300, calculate_paper(input),
    assert_equal 3737498, calculate_ribbon(input)
  end
end
