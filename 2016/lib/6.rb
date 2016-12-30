def part_1_6(input)
  dict = {}
  input.each do |code|
    code.chars.each_with_index do |char, i|
      if dict[i]
        dict[i] += char
      else
        dict[i] = char
      end
    end
  end
  dict.map do |k, v|
    v.chars.max_by { |i| v.count(i) }
  end.join
end

def part_2_6(input)
  dict = {}
  input.each do |code|
    code.chars.each_with_index do |char, i|
      if dict[i]
        dict[i] += char
      else
        dict[i] = char
      end
    end
  end
  dict.map do |k, v|
    v.chars.min_by { |i| v.count(i) }
  end.join
end
