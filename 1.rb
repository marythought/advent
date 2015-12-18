input = IO.read("inputs/1.txt").chomp!

def count_floors(input)
  floor = 0
  string = input.split(//)
  p input
  floor = string.shift == "(" ? floor + 1 : floor - 1 while string.length > 0
  return floor
end

def basement_entry(input)
  floor = 0
  string = input.split(//)
  string.each_with_index do | char, index |
    floor = char == "(" ? floor + 1 : floor - 1
    return index + 1 if floor < 0
  end
end

puts count_floors(input)
puts basement_entry(input)
