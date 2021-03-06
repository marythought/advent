# --- Day 12: JSAbacusFramework.io ---
#
# Santa's Accounting-Elves have a JSON document which contains a variety of
# things: arrays ([1,2,3]), objects ({"a":1, "b":2}), numbers, and strings.
# Your first job is to simply find all of the numbers throughout the document &
# add them together.

def find_numbers(input)
  input = input.split(/[a-zA-Z",{:\[\]}]/)
  input.delete("")
  input.map(&:to_i).reduce(:+)
end

# 214938 too high -- I accidentally eliminated negative numbers by using
# \D in my regex
# 191164 is correct

# --- Part Two ---
#
# Uh oh - the Accounting-Elves have realized that they double-counted
# everything red.
#
# Ignore any object (and all of its children) which has any property with
# the value "red". Do this only for objects ({...}), not arrays ([...]).
#
# [1,2,3] still has a sum of 6.
# [1,{"c":"red","b":2},3] now has a sum of 4, because the middle object is
# ignored.
# {"d":"red","e":[1,2,3,4],"f":5} now has a sum of 0, because the entire
# structure is ignored.
# [1,"red",5] has a sum of 6, because "red" in an array has no effect.

def find_non_red_numbers(input)
  input = input.split(/[a-zA-Z",{:\[\]}]/)
  input.delete("")
  input.map(&:to_i).reduce(:+)
end
