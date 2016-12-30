def part_1_9(input)
  length = 0
  until input.length == 0
    char = input[0]
    if char == "("
      phrase = input.match(/(\d*)x(\d*)/)[1].to_i
      repeat = input.match(/(\d*)x(\d*)/)[2].to_i
      length += phrase * repeat
      input = input.sub(/(\(\d*)x(\d*)\)/, '')[phrase..-1]
    else
      length += 1
      input = input[1..-1]
    end
  end
  length
end

def part_2_9(input)
end
