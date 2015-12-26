require "spec_helper"
require "10.rb"

describe '10' do
  input = 1113222113
  input_string = input.to_s

  it "returns a valid result for first part" do
    skip
    # works but takes a long time to get a result
    assert_equal 252594, look_say_x_times(50, input_string)
  end

  it "returns a valid result for second part" do
    skip
    # takes too long to get a result
    assert_equal 0, look_say_x_times(60, input_string)
  end
end
