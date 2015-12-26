# --- Day 15: Science for Hungry People ---
#
# Today, you set out on the task of perfecting your milk-dunking cookie recipe. All you have to do is find the right balance of ingredients.

# Given the ingredients in your kitchen and their properties, what is the total score of the highest-scoring cookie you can make?

input = "Sprinkles: capacity 5, durability -1, flavor 0, texture 0, calories 5
PeanutButter: capacity -1, durability 3, flavor 0, texture 0, calories 1
Frosting: capacity 0, durability -1, flavor 4, texture 0, calories 6
Sugar: capacity -1, durability 0, flavor 0, texture 2, calories 8"

class Ingredient
  attr_accessor :name, :capacity, :durability, :flavor, :texture, :calories
  def initialize(name, capacity, durability, flavor, texture, calories)
    @name = name
    @capacity = capacity
    @durability = durability
    @flavor = flavor
    @texture = texture
    @calories = calories
  end
end

class Cookie
  attr_accessor :ingredients, :capacity, :durability, :flavor, :texture

  def initialize
    @ingredients = []
    # {11=>#<Ingredient:0x007fd538e48bc0 @name="Sprinkles", @capacity=5, @durability=-1, @flavor=0, @texture=0>, "PeanutButter"...}
    @capacity = 0
    @durability = 0
    @flavor = 0
    @texture = 0
    @ingredient_amounts = {}
  end

  def add(ingredient, amount)
    @ingredients << ingredient
    @ingredient_amounts[ingredient.name] = amount
  end

  def set_properties
    @ingredients.each do |ingredient|
      @capacity += @ingredient_amounts[ingredient.name] * ingredient.capacity
      @durability += @ingredient_amounts[ingredient.name] * ingredient.durability
      @flavor += @ingredient_amounts[ingredient.name] + ingredient.flavor
      @texture += @ingredient_amounts[ingredient.name] + ingredient.texture
    end
    @capacity = 0 if @capacity < 0
    @durability = 0 if @durability < 0
    @flavor = 0 if @flavor < 0
    @texture = 0 if @texture < 0
  end

  def get_score
    @capacity * @durability * @flavor * @texture
  end
end

class TestKitchen
  attr_accessor :best_cookie, :cookies

  def initialize(input)
    @input = input
    @ingredients = []
    @combos = []
    @best_cookie = 0
    @cookies = []
  end

  def process_input
    lines = @input.split("\n")
    lines = lines.map { |line| line.split(": ") }.map { |line| [line[0], line[-1].split(/capacity | durability | flavor | texture | calories /)]}.map {|line| line.flatten}.each {|line| line.delete("")}
    lines.each do |line|
      ingredient = Ingredient.new(line.shift, line.shift.to_i, line.shift.to_i, line.shift.to_i, line.shift.to_i, line.shift.to_i)
      @ingredients << ingredient
    end
  end

  def find_combos
    @combos << [@ingredients[0], 25, @ingredients[1], 25, @ingredients[2], 25, @ingredients[3], 25]
    @combos << [@ingredients[0], 20, @ingredients[1], 20, @ingredients[2], 20, @ingredients[3], 40]
    @combos << [@ingredients[0], 50, @ingredients[1], 50]
    @combos << [@ingredients[2], 50, @ingredients[3], 50]
    @combos << [@ingredients[3], 100]
    @combos << [@ingredients[2], 100]
  end

  def make_cookies
    while @combos.length > 0
      this_combo = @combos.shift
      cookie = Cookie.new
      while this_combo.length > 0
        cookie.add(this_combo.shift, this_combo.shift)
      end
      cookie.set_properties
      @cookies << cookie
    end
  end

  def get_scores
    @cookies.each do |cookie|
      puts cookie.get_score
      @best_cookie = cookie.get_score if cookie.get_score > @best_cookie
    end
    @best_cookie
  end
end

tk = TestKitchen.new(input)
tk.process_input
tk.find_combos
tk.make_cookies
puts tk.get_scores
