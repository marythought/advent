# --- Day 4: The Ideal Stocking Stuffer ---
#
# Santa needs help mining some AdventCoins (very similar to bitcoins) to use
# as gifts for all the economically forward-thinking little girls and boys.
#
# To do this, he needs to find MD5 hashes which, in hexadecimal, start with at
#  least five zeroes. The input to the MD5 hash is some secret key (your puzzle
#  input, given below) followed by a number in decimal. To mine AdventCoins,
#  you must find Santa the lowest positive number
# (no leading zeroes: 1, 2, 3, ...) that produces such a hash.

require 'digest'

def get_hash_five(string)
  1.upto(1_000_000) do |i|
    md5 = Digest::MD5.new
    hex = md5.update(string + i.to_s)
    return i if hex.to_s[0..4] == "00000"
  end
end

def get_hash_six(string)
  1_000_001.upto(1_000_000_000) do |i|
    md5 = Digest::MD5.new
    hex = md5.update(string + i.to_s)
    return i if hex.to_s[0..5] == "000000"
  end
end
