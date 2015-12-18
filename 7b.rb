input = IO.read("inputs/7.txt").chomp!

lines = input.each_line.map do |line|
  line.split("->").map do |entry|
    entry.strip
  end
end

# [["gl AND gm", "go"], ["he RSHIFT 5", "hh"], ["NOT gb", "gc"], ["hq AND hs", "ht"], ["hz RSHIFT 3", "ib"], ["hz RSHIFT 2", "ia"], ["fq OR fr", "fs"], ["hx OR hy", "hz"], ["he AND hp", "hr"], ["gj RSHIFT 5", "gm"], ["hf AND hl", "hn"], ["hv OR hu", "hw"], ["NOT hj", "hk"], ["gj RSHIFT 3", "gl"], ["fo RSHIFT 3", "fq"], ["he RSHIFT 2", "hf"], ["44430", "b"]]

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

toy = Toy.new
toy.parse_inputs(lines)
old_a = toy.find_value("a")
puts toy.wires["b"]
toy.wires["b"] = toy.find_value("a")
toy.reset
toy.parse_inputs(lines)
toy.wires["b"] = old_a
puts "now the value of b is #{toy.wires["b"]}"
puts toy.find_value("a")
