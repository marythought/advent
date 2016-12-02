# --- Day 1: Not Quite Lisp ---
# Santa is trying to deliver presents in a large apartment building, but he
# can't find the right floor - the directions he got are a little confusing.
# He starts on the ground floor (floor 0) and then follows the instructions
# one character at a time.
#
# An opening parenthesis, (, means he should go up one floor, and a closing
# parenthesis, ), means he should go down one floor.

def count_floors(input)
  floor = 0
  string = input.split(//)
  string.reverse
  floor = string.pop == "(" ? floor + 1 : floor - 1 while string.length > 0
  floor
end

def basement_entry(input)
  floor = 0
  string = input.split(//)
  string.each_with_index do |char, index|
    floor = char == "(" ? floor + 1 : floor - 1
    return index + 1 if floor < 0
  end
end
