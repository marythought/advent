require "spec_helper"
require "4.rb"

describe '4' do
  input = "iwrupvqb"

  it "returns a valid result for the first part" do
    skip
    # works but takes a long time, remove for complete testing
    assert_equal get_hash_five(input), 346386
  end

  it "returns a valid result for the second part" do
    skip
    # works but takes a long time, remove for complete testing
    assert_equal get_hash_six(input), 9958218
  end
end
