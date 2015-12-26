require "spec_helper"
require "2.rb"

describe '2' do
  input = IO.readlines("inputs/2.txt")

  it "returns a valid result" do
    assert_equal calculate_paper(input), 1586300
    assert_equal calculate_ribbon(input), 3737498
  end
end
