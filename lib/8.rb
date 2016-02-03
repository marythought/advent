def find_difference(input)
  chars_in_code = 0
  chars_in_memory = 0

  input.each do |line|
    line.chomp!
    chars_in_code += line.length # all chars
    new_line = line[1..-2] # remove end quotes
    new_line = new_line.gsub(/\\x[a-fA-F0-9]{2}/, '\'').gsub(/\\"/, '"').gsub(/\\\\/, '\\')
    # find and replace \" with " and \\ with \
    chars_in_memory += new_line.length
  end
  chars_in_code - chars_in_memory
end

# --- Part Two ---
# Now, let's go the other way. In addition to finding the number of characters
# of code, you should now encode each code representation as a new string and
# find the number of characters of the new encoded representation, including
# the surrounding double quotes.
# For example:
# "" encodes to "\"\"", an increase from 2 characters to 6.
# "abc" encodes to "\"abc\"", an increase from 5 characters to 9.
# "aaa\"aaa" encodes to "\"aaa\\\"aaa\"", an increase from 10 characters to 16.
# "\x27" encodes to "\"\\x27\"", an increase from 6 characters to 11.
# Your task is to find the total number of characters to represent the newly
# encoded strings minus the number of characters of code in each original
# string literal. For example, for the strings above, the total encoded
# length (6 + 9 + 16 + 11 = 42) minus the characters in the original code
# representation (23, just like in the first part of this puzzle) is
# 42 - 23 = 19.

def encode(input)
  chars_in_code = 0
  chars_in_encode = 0

  input.each do |line|
    line.chomp!
    chars_in_code += line.length
    new_line = '"' + line.gsub(/"/, '\"').gsub(/\\/, '\\') + '"'
    chars_in_encode += new_line.length
  end
  chars_in_encode - chars_in_code
end

# try 1448 -- too low
# 2048 -- too high

input = IO.readlines("inputs/8.txt")
puts encode(input)
