input = IO.read("inputs/6.txt").chomp!

lines = input.each_line.map do |line|
  line.partition(/[\d,]+/).map do |entry|
    entry.gsub(" through ", "").chomp
  end
end

# test_lines = [["toggle ", "491,615", "998,836"], ["turn off ", "210,146", "221,482"], ["turn off ", "209,780", "572,894"], ["turn on ", "766,112", "792,868"], ["turn on ", "222,12", "856,241"]]

class Grid
  attr_accessor :lights

  def initialize size
    @lights = {}
    @size = size
    populate
  end

  def populate
    0.upto @size-1 do |x|
      0.upto @size-1 do |y|
        @lights["#{x},#{y}"] = 0
      end
    end
  end

  def process_input input
    input.each do |line|
      command, light1, light2 = line
      if command == "toggle "
        toggle(light1, light2)
      elsif command == "turn on "
        turn_on_range(light1, light2)
      else
        turn_off_range(light1, light2)
      end
    end
  end

  def get_range(light1, light2)
    #125,324 through 433,704
    range = []
    light1 = light1.split(",").map{|i|i.to_i}
    light2 = light2.split(",").map{|i|i.to_i}
    light1[0].upto light2[0] do |x|
      light1[1].upto light2[1] do |y|
        range << [x,y]
      end
    end
    return range # array of arrays
  end

  def is_on? light # comes in as single array ie [491, 615]
    @lights["#{light[0]},#{light[1]}"] > 0
  end

  def turn_off light
    @lights["#{light[0]},#{light[1]}"] -= 1 if @lights["#{light[0]},#{light[1]}"] > 0
  end

  def turn_on light
    @lights["#{light[0]},#{light[1]}"] += 1
  end

  def toggle(light1, light2)
    these_lights = get_range(light1, light2)
    these_lights.each do |light|
      turn_on light
      turn_on light
    end
  end

  def turn_on_range (light1, light2)
    these_lights = get_range(light1, light2)
    these_lights.each do |light|
      turn_on light
    end
  end

  def turn_off_range (light1, light2)
    these_lights = get_range(light1, light2)
    these_lights.each do |light|
      turn_off light
    end
  end

  def count_lights
    lights_on = 0
    @lights.each_key do |key|
      lights_on += @lights[key] if @lights[key] > 0
    end
    return lights_on
  end
end

grid = Grid.new(1000)
grid.process_input(lines)
puts grid.count_lights
# 912549 too low...
