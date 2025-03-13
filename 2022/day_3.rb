class Day3
  PRIORITY_MAP = {
    "a" => 1,
    "b" => 2,
    "c" => 3,
    "d" => 4,
    "e" => 5,
    "f" => 6,
    "g" => 7,
    "h" => 8,
    "i" => 9,
    "j" => 10,
    "k" => 11,
    "l" => 12,
    "m" => 13,
    "n" => 14,
    "o" => 15,
    "p" => 16,
    "q" => 17,
    "r" => 18,
    "s" => 19,
    "t" => 20,
    "u" => 21,
    "v" => 22,
    "w" => 23,
    "x" => 24,
    "y" => 25,
    "z" => 26,
    "A" => 27,
    "B" => 28,
    "C" => 29,
    "D" => 30,
    "E" => 31,
    "F" => 32,
    "G" => 33,
    "H" => 34,
    "I" => 35,
    "J" => 36,
    "K" => 37,
    "L" => 38,
    "M" => 39,
    "N" => 40,
    "O" => 41,
    "P" => 42,
    "Q" => 43,
    "R" => 44,
    "S" => 45,
    "T" => 46,
    "U" => 47,
    "V" => 48,
    "W" => 49,
    "X" => 50,
    "Y" => 51,
    "Z" => 52
  }

  def self.call_part_1
    input = read_input

    values = input.map do |string|
      rucksack = Rucksack.new(string)
      rucksack.union
    end.flatten

    values.map do |value|
      PRIORITY_MAP[value]
    end.sum
  end

  def self.call_part_2
    input = read_input

    values = input.each_slice(3).map { |group| RucksackGroup.new(group).union }.flatten

    values.map do |value|
      PRIORITY_MAP[value]
    end.sum
  end

  def self.call
    call_part_1
    call_part_2
  end

  def self.read_input
    File.readlines('day_3.txt', chomp: true)
  end
end

class Rucksack
  attr_reader :contents

  def initialize(string)
    @contents = string
    @size = string.length
  end

  def union
    @union ||= front_compartment.chars & back_compartment.chars
  end

  private

  def front_compartment
    @front_compartment ||= @contents[0..(@size / 2) - 1]
  end

  def back_compartment
    @back_compartment ||= @contents[(@size / 2)..-1]
  end
end

class RucksackGroup
  def initialize(*rucksacks)
    @rucksacks = rucksacks.flatten
  end

  def union
    @rucksacks.map(&:chars).reduce(:&)
  end
end

# Test input
test_input = [
  "vJrwpWtwJgWrhcsFMMfFFhFp",
  "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
  "PmmdzqPrVvPwwTWBwg",
  "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
  "ttgJtRGJQctTZtZT",
  "CrZsJsPPZsGzwwsLwLmpwMDw"
]

result = Day3.call_part_1
expected_result = 157

puts result
puts result == expected_result

result = Day3.call_part_2
expected_result = 70
puts result
puts result == expected_result

