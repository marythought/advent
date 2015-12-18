# --- Day 3: Perfectly Spherical Houses in a Vacuum ---
# Santa is delivering presents to an infinite two-dimensional grid of houses.
#
# He begins by delivering a present to the house at his starting location, and then an elf at the North Pole calls him via radio and tells him where to move next. Moves are always exactly one house to the north (^), south (v), east (>), or west (<). After each move, he delivers another present to the house at his new location.
#
# However, the elf back at the north pole has had a little too much eggnog, and so his directions are a little off, and Santa ends up visiting some houses more than once. How many houses receive at least one present?

input = IO.read("inputs/3.txt").chomp!

def deliver_presents(input)
  delivered = [[0,0]]
  input = input.split("")
  while input.length > 0
    move = input.shift # >
    if move == ">"
      delivered << [delivered[-1][0] + 1, delivered[-1][1]]
    elsif move == "<"
      delivered << [delivered[-1][0] - 1, delivered[-1][1]]
    elsif move == "^"
      delivered << [delivered[-1][0], delivered[-1][1] + 1]
    elsif move == "v"
      delivered << [delivered[-1][0], delivered[-1][1] - 1]
    end
  end
  delivered.uniq.length
end

puts deliver_presents(input)

# --- Part Two ---
#
# The next year, to speed up the process, Santa creates a robot version of himself, Robo-Santa, to deliver presents with him.
#
# Santa and Robo-Santa start at the same location (delivering two presents to the same starting house), then take turns moving based on instructions from the elf, who is eggnoggedly reading from the same script as the previous year.
#
# This year, how many houses receive at least one present?
#
# For example:
#
# ^v delivers presents to 3 houses, because Santa goes north, and then Robo-Santa goes south.
# ^>v< now delivers presents to 3 houses, and Santa and Robo-Santa end up back where they started.
# ^v^v^v^v^v now delivers presents to 11 houses, with Santa going one direction and Robo-Santa going the other.

def robo_santa(input)
  santa_delivered = [[0,0]]
  robo_delivered = [[0,0]]
  input = input.split("")
  while input.length > 1
    santa_move = input.shift
    santa_delivered << get_move(santa_move, santa_delivered)
    robo_move = input.shift
    robo_delivered << get_move(robo_move, robo_delivered)
  end
  if input.length == 1
    santa_move = input.shift
    santa_delivered << get_move(santa_move, santa_delivered)
  end
  santa_delivered.concat(robo_delivered).uniq.length
end

def get_move(move, delivery_array)
  if move == ">"
    [delivery_array[-1][0] + 1, delivery_array[-1][1]]
  elsif move == "<"
    [delivery_array[-1][0] - 1, delivery_array[-1][1]]
  elsif move == "^"
    [delivery_array[-1][0], delivery_array[-1][1] + 1]
  elsif move == "v"
    [delivery_array[-1][0], delivery_array[-1][1] - 1]
  end
end

puts robo_santa(input)
