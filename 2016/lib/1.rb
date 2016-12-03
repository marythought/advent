def find_HQ(input)
  facing = "north"
  x, y = [0, 0]
  visited = []
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
  x.abs + y.abs
end

def find_double_visited(input)
  facing = "north"
  x, y = [0, 0]
  visited = []
  double_visited = []
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
  (double_visited[0][0]).abs + (double_visited[0][1]).abs
end

def check(coordinates, visited, double_visited)
  double_visited << coordinates if visited.include?(coordinates)
end
