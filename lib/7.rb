def clean(input)
  lines = input.each_line.map do |line|
    line.split("->").map do |entry|
      entry.strip
    end
  end
end

# [["gl AND gm", "go"], ["he RSHIFT 5", "hh"], ["NOT gb", "gc"], ["hq AND hs", "ht"], ["hz RSHIFT 3", "ib"], ["hz RSHIFT 2", "ia"]]

class Toy
  attr_accessor :wires

  def initialize
    @wires = {}
  end

  def parse_inputs(lines)
    lines.each do |line|
      value, id = line # ["fo RSHIFT 3", "fq"]
      @wires[id] = value
    end
  end

  def find_value(id)
    if id.to_i.to_s == id
      return id.to_i
    elsif id.is_a? Numeric
      return id
    end
    value = @wires[id]
    if value.to_i.to_s == value
      return value.to_i
    elsif value.is_a? Numeric
      return value
    end
    directions = value.split(" ")
    if directions.length == 1
      @wires[id] = find_value(directions[0])
    elsif directions[1] == "AND"
      @wires[id] = find_value(directions[0]) & find_value(directions[-1])
    elsif directions[1] == "OR"
      @wires[id] = find_value(directions[0]) | find_value(directions[-1])
    elsif directions.length == 2
      @wires[id] = find_value(directions[-1]) ^ 65535
    elsif directions[1] == "RSHIFT"
      @wires[id] = find_value(directions[0]) >> directions[-1].to_i
    elsif directions[1] == "LSHIFT"
      @wires[id] = find_value(directions[0]) << directions[-1].to_i
    end
  end

  def reset
    @wires = {}
  end
end
