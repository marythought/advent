require 'spec_helper'
require '4.rb'

describe '4' do
  input = IO.read('inputs/4.txt').split("\n")

  it 'returns accurate test data' do
    assert_equal 123, part_1_4(['aaaaa-bbb-z-y-x-123[abxyz]'])[0]
    assert_equal 1514, part_1_4(['aaaaa-bbb-z-y-x-123[abxyz]', 'a-b-c-d-e-f-g-h-987[abcde]', 'not-a-real-room-404[oarel]', 'totally-real-room-200[decoy]'])[0]
    assert_equal 343, part_1_4(['qzmt-zixmtkozy-ivhz-343[zimth]'])[0]
    # assert_equal 'very encrypted name 343', part_2_4(['qzmt-zixmtkozy-ivhz-343[zimth]'])
  end

  it 'returns a valid result' do
    assert_equal 137896, part_1_4(input)[0]
    assert_equal '501', part_2_4(input)
  end
end
