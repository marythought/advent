# The Document indicates that you should start at the given coordinates (where you just landed) and face North. Then, follow the provided sequence: either turn left (L) or right (R) 90 degrees, then walk forward the given number of blocks, ending at a new intersection.
#
# There's no time to follow such ridiculous instructions on foot, though, so you take a moment and work out the destination. Given that you can only walk on the street grid of the city, how far is the shortest path to the destination?
#
# For example:
#
# Following R2, L3 leaves you 2 blocks East and 3 blocks North, or 5 blocks away.
# R2, R2, R2 leaves you 2 blocks due South of your starting position, which is 2 blocks away.
# R5, L5, R5, R3 leaves you 12 blocks away.
# How many blocks away is Easter Bunny HQ?

input = "R3, L5, R1, R2, L5, R2, R3, L2, L5, R5, L4, L3, R5, L1, R3, R4, R1, L3, R3, L2, L5, L2, R4, R5, R5, L4, L3, L3, R4, R4, R5, L5, L3, R2, R2, L3, L4, L5, R1, R3, L3, R2, L3, R5, L194, L2, L5, R2, R1, R1, L1, L5, L4, R4, R2, R2, L4, L1, R2, R53, R3, L5, R72, R2, L5, R3, L4, R187, L4, L5, L2, R1, R3, R5, L4, L4, R2, R5, L5, L4, L3, R5, L2, R1, R1, R4, L1, R2, L3, R5, L4, R2, L3, R1, L4, R4, L1, L2, R3, L1, L1, R4, R3, L4, R2, R5, L2, L3, L3, L1, R3, R5, R2, R3, R1, R2, L1, L4, L5, L2, R4, R5, L2, R4, R4, L3, R2, R1, L4, R3, L3, L4, L3, L1, R3, L2, R2, L4, L4, L5, R3, R5, R3, L2, R5, L2, L1, L5, L1, R2, R4, L5, R2, L4, L5, L4, L5, L2, L5, L4, R5, R3, R2, R2, L3, R3, L2, L5"

input = input.delete(",").split

facing = "north"
x, y = [0, 0]

visited = []

# part 1
input.each do |step|
  if facing == "north"
    if step[0] == "L"
      x -= step[1..-1].to_i
      facing = "west"
    else
      x += step[1..-1].to_i
      facing = "east"
    end
  elsif facing == "east"
    if step[0] == "L"
      y += step[1..-1].to_i
      facing = "north"
    else
      y -= step[1..-1].to_i
      facing = "south"
    end
  elsif facing == "south"
    if step[0] == "L"
      x += step[1..-1].to_i
      facing = "east"
    else
      x -= step[1..-1].to_i
      facing = "west"
    end
  elsif facing == "west"
    if step[0] == "L"
      y -= step[1..-1].to_i
      facing = "south"
    else
      y += step[1..-1].to_i
      facing = "north"
    end
  end
end
puts "part 1 solution is #{x + y}"

# part 2

facing = "north"
x, y = [0, 0]

visited = []
double_visited = []

def check(coordinates, visited, double_visited) #[1, 0]
  if visited.include?(coordinates)
    double_visited << coordinates
  end
  double_visited
end

input.each do |step|
  if facing == "north"
    if step[0] == "L"
      step[1..-1].to_i.times do |baby_step|
        coordinates = [(x - baby_step), y]
        check(coordinates, visited, double_visited)
        visited << coordinates
      end
      x -= step[1..-1].to_i
      facing = "west"
    else
      step[1..-1].to_i.times do |baby_step|
        coordinates = [(x + baby_step), y]
        check(coordinates, visited, double_visited)
        visited << coordinates
      end
      x += step[1..-1].to_i
      facing = "east"
    end
  elsif facing == "south"
    if step[0] == "L"
      step[1..-1].to_i.times do |baby_step|
        coordinates = [(x + baby_step), y]
        check(coordinates, visited, double_visited)
        visited << coordinates
      end
      x += step[1..-1].to_i
      facing = "east"
    else
      step[1..-1].to_i.times do |baby_step|
        coordinates = [(x - baby_step), y]
        check(coordinates, visited, double_visited)
        visited << coordinates
      end
      x -= step[1..-1].to_i
      facing = "west"
    end
  elsif facing == "east"
    if step[0] == "L"
      step[1..-1].to_i.times do |baby_step|
        coordinates = [x, (y + baby_step)]
        check(coordinates, visited, double_visited)
        visited << coordinates
      end
      y += step[1..-1].to_i
      facing = "north"
    else
      step[1..-1].to_i.times do |baby_step|
        coordinates = [x, (y - baby_step)]
        check(coordinates, visited, double_visited)
        visited << coordinates
      end
      y -= step[1..-1].to_i
      facing = "south"
    end
  elsif facing == "west"
    if step[0] == "L"
      step[1..-1].to_i.times do |baby_step|
        coordinates = [x, (y - baby_step)]
        check(coordinates, visited, double_visited)
        visited << coordinates
      end
      y -= step[1..-1].to_i
      facing = "south"
    else
      step[1..-1].to_i.times do |baby_step|
        coordinates = [x, (y + baby_step)]
        check(coordinates, visited, double_visited)
        visited << coordinates
      end
      y += step[1..-1].to_i
      facing = "north"
    end
  end
end

puts "the answer to part 2 is #{(double_visited[0][0]).abs + (double_visited[0][1]).abs}"
