class Sue
  attr_accessor :number, :children, :cats, :samoyeds, :pomeranians, :akitas, :vizslas, :goldfish, :trees, :cars, :perfumes

  def initialize(number)
    @number = number
    @children = "?"
    @cats = "?"
    @samoyeds = "?"
    @pomeranians = "?"
    @akitas = "?"
    @vizslas = "?"
    @goldfish = "?"
    @trees = "?"
    @cars = "?"
    @perfumes = "?"
  end

  def is_match?
    return ((@children.is_a?(Fixnum) && @children == 3) || @children == "?") &&
           ((@cats.is_a?(Fixnum) && @cats == 7) || @cats == "?") &&
           ((@samoyeds.is_a?(Fixnum) && @samoyeds == 2) || @samoyeds == "?") &&
           ((@pomeranians.is_a?(Fixnum) && @pomeranians == 3) || @pomeranians == "?") &&
           ((@akitas.is_a?(Fixnum) && @akitas == 0) || @akitas == "?") &&
           ((@vizslas.is_a?(Fixnum) && @vizslas == 0) || @vizslas == "?") &&
           ((@goldfish.is_a?(Fixnum) && @goldfish == 5) || @goldfish == "?") &&
           ((@trees.is_a?(Fixnum) && @trees == 3) || @trees == "?") &&
           ((@cars.is_a?(Fixnum) && @cars == 2) || @cars == "?") &&
           ((@perfumes.is_a?(Fixnum) && @perfumes) == 1 || @perfumes == "?")
  end
end

# Sue 1: goldfish: 6, trees: 9, akitas: 0\n

def clean16(input)
  input = input.map do |sue|
    sue.split(" ").map{|item|item.gsub(":", "").gsub(",", "")}
  end
end

def assign(this_sue, first, first_num, second, second_num, third, third_num)
  this_sue.children = first_num.to_i if first == "children"
  this_sue.children = second_num.to_i if second == "children"
  this_sue.children = third_num.to_i if third == "children"
  this_sue.cats = first_num.to_i if first == "cats"
  this_sue.cats = second_num.to_i if second == "cats"
  this_sue.cats = third_num.to_i if third == "cats"
  this_sue.samoyeds = first_num.to_i if first == "samoyeds"
  this_sue.samoyeds = second_num.to_i if second == "samoyeds"
  this_sue.samoyeds = third_num.to_i if third == "samoyeds"
  this_sue.pomeranians = first_num.to_i if first == "pomeranians"
  this_sue.pomeranians = second_num.to_i if second == "pomeranians"
  this_sue.pomeranians = third_num.to_i if third == "pomeranians"
  this_sue.akitas = first_num.to_i if first == "akitas"
  this_sue.akitas = second_num.to_i if second == "akitas"
  this_sue.akitas = third_num.to_i if third == "akitas"
  this_sue.vizslas = first_num.to_i if first == "vizslas"
  this_sue.vizslas = second_num.to_i if second == "vizslas"
  this_sue.vizslas = third_num.to_i if third == "vizslas"
  this_sue.goldfish = first_num.to_i if first == "goldfish"
  this_sue.goldfish = second_num.to_i if second == "goldfish"
  this_sue.goldfish = third_num.to_i if third == "goldfish"
  this_sue.trees = first_num.to_i if first == "trees"
  this_sue.trees = second_num.to_i if second == "trees"
  this_sue.trees = third_num.to_i if third == "trees"
  this_sue.cars = first_num.to_i if first == "cars"
  this_sue.cars = second_num.to_i if second == "cars"
  this_sue.cars = third_num.to_i if third == "cars"
  this_sue.perfumes = first_num.to_i if first == "perfumes"
  this_sue.perfumes = second_num.to_i if second == "perfumes"
  this_sue.perfumes = third_num.to_i if third == "perfumes"
end

def process_sues(input)
  sues = []

  input.each do |sue|
    sue.shift
    number, first, first_num, second, second_num, third, third_num = sue
    this_sue = Sue.new(number)
    assign(this_sue, first, first_num, second, second_num, third, third_num)
    sues << this_sue
  end

  sues.each do |sue|
    return sue.number.to_i if sue.is_match?
  end
end


# Part Two match

class Sue2
  attr_accessor :number, :children, :cats, :samoyeds, :pomeranians, :akitas, :vizslas, :goldfish, :trees, :cars, :perfumes

  def initialize(number)
    @number = number
    @children = "?"
    @cats = "?"
    @samoyeds = "?"
    @pomeranians = "?"
    @akitas = "?"
    @vizslas = "?"
    @goldfish = "?"
    @trees = "?"
    @cars = "?"
    @perfumes = "?"
  end

  def is_match?
    return ((@children.is_a?(Fixnum) && @children == 3) || @children == "?") &&
           ((@cats.is_a?(Fixnum) && @cats > 7) || @cats == "?") &&
           ((@samoyeds.is_a?(Fixnum) && @samoyeds == 2) || @samoyeds == "?") &&
           ((@pomeranians.is_a?(Fixnum) && @pomeranians < 3) || @pomeranians == "?") &&
           ((@akitas.is_a?(Fixnum) && @akitas == 0) || @akitas == "?") &&
           ((@vizslas.is_a?(Fixnum) && @vizslas == 0) || @vizslas == "?") &&
           ((@goldfish.is_a?(Fixnum) && @goldfish < 5) || @goldfish == "?") &&
           ((@trees.is_a?(Fixnum) && @trees > 3) || @trees == "?") &&
           ((@cars.is_a?(Fixnum) && @cars == 2) || @cars == "?") &&
           ((@perfumes.is_a?(Fixnum) && @perfumes) == 1 || @perfumes == "?")
  end
end

def process_sues2(input)
  sues = []

  input.each do |sue|
    sue.shift
    number, first, first_num, second, second_num, third, third_num = sue
    this_sue = Sue2.new(number)
    assign(this_sue, first, first_num, second, second_num, third, third_num)
    sues << this_sue
  end

  sues.each do |sue|
    return sue.number.to_i if sue.is_match?
  end
end
