# --- Day 6: Probably a Fire Hazard ---
#
# Because your neighbors keep defeating you in the holiday house decorating
# contest year after year, you've decided to deploy one million lights in a
# 1000x1000 grid. Furthermore, because you've been especially nice this year,
# Santa has mailed you instructions on how to display the ideal lighting
# configuration.
#
# Lights in your grid are numbered from 0 to 999 in each direction; the lights
# at each corner are at 0,0, 0,999, 999,999, and 999,0. The instructions
# include whether to turn on, turn off, or toggle various inclusive ranges
# given as coordinate pairs. Each coordinate pair represents opposite corners
# of a rectangle, inclusive; a coordinate pair like 0,0 through 2,2 therefore
# refers to 9 lights in a 3x3 square. The lights all start turned off.

# test_lines = [["toggle ", "491,615", "998,836"], ["turn off ", "210,146",
# "221,482"], ["turn off ", "209,780", "572,894"], ["turn on ", "766,112",
# "792,868"], ["turn on ", "222,12", "856,241"]]

def clean(input)
  input.each_line.map do |line|
    line.partition(/[\d,]+/).map do |entry|
      entry.gsub(" through ", "").chomp
    end
  end
end

class Grid
  attr_accessor :lights

  def initialize(size)
    @lights = {}
    @size = size
    populate
  end

  def populate
    0.upto(@size - 1) do |x|
      0.upto(@size - 1) do |y|
        @lights["#{x},#{y}"] = "off"
      end
    end
  end

  def process_input(input)
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
    # 125,324 through 433,704
    range = []
    light1 = light1.split(",").map(&:to_i)
    light2 = light2.split(",").map(&:to_i)
    light1[0].upto(light2[0]) do |x|
      light1[1].upto(light2[1]) do |y|
        range << [x, y]
      end
    end
    range # array of arrays
  end

  def on?(light) # comes in as single array ie [491, 615]
    @lights["#{light[0]},#{light[1]}"] == "on"
  end

  def turn_off(light)
    @lights["#{light[0]},#{light[1]}"] = "off"
  end

  def turn_on(light)
    @lights["#{light[0]},#{light[1]}"] = "on"
  end

  def toggle(light1, light2)
    these_lights = get_range(light1, light2)
    these_lights.each do |light|
      if on? light
        turn_off light
      else
        turn_on light
      end
    end
  end

  def turn_on_range(light1, light2)
    these_lights = get_range(light1, light2)
    these_lights.each do |light|
      turn_on light
    end
  end

  def turn_off_range(light1, light2)
    these_lights = get_range(light1, light2)
    these_lights.each do |light|
      turn_off light
    end
  end

  def count_lights
    lights_on = 0
    @lights.each_key do |key|
      lights_on += 1 if @lights[key] == "on"
    end
    lights_on
  end
end

class Grid2
  attr_accessor :lights

  def initialize(size)
    @lights = {}
    @size = size
    populate
  end

  def populate
    0.upto(@size - 1) do |x|
      0.upto(@size - 1) do |y|
        @lights["#{x},#{y}"] = 0
      end
    end
  end

  def process_input(input)
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
    # 125,324 through 433,704
    range = []
    light1 = light1.split(",").map(&:to_i)
    light2 = light2.split(",").map(&:to_i)
    light1[0].upto(light2[0]) do |x|
      light1[1].upto(light2[1]) do |y|
        range << [x, y]
      end
    end
    range # array of arrays
  end

  def on?(light) # comes in as single array ie [491, 615]
    @lights["#{light[0]},#{light[1]}"] > 0
  end

  def turn_off(light)
    @lights["#{light[0]},#{light[1]}"] -= 1 if @lights["#{light[0]},#{light[1]}"] > 0
  end

  def turn_on(light)
    @lights["#{light[0]},#{light[1]}"] += 1
  end

  def toggle(light1, light2)
    these_lights = get_range(light1, light2)
    these_lights.each do |light|
      turn_on light
      turn_on light
    end
  end

  def turn_on_range(light1, light2)
    these_lights = get_range(light1, light2)
    these_lights.each do |light|
      turn_on light
    end
  end

  def turn_off_range(light1, light2)
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
    lights_on
  end
end
