require "spec_helper"
require "11.rb"

describe '11' do
  input = "vzbxkghz"

  it "returns a valid result for first part" do
    # works but takes a long time to get a result
    assert_equal "vzbxxyzz", find_next(input)
  end

  it "returns a valid result for second part" do
    new_input = find_next(input)
    assert_equal "vzcaabcc", find_next(new_input)
  end
end
