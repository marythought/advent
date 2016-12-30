def part_1_12(input)
  # ["cpy 1 a", "cpy 1 b", "cpy 26 d", "jnz c 2", "jnz 1 5", "cpy 7 c", "inc d", "dec c", "jnz c -2", "cpy a c", "inc a", "dec b", "jnz b -2", "cpy c b", "dec d", "jnz d -6", "cpy 19 c", "cpy 11 d", "inc a", "dec d", "jnz d -2", "dec c", "jnz c -5", "END"]
  values = {a: 0, b: 0, c: 0, d: 0}
  loop do
    command = input[0].split
    case command[0]
    when "cpy"
      destination = command[2]
      value = command[1]
      if value.to_i > 0
        values[destination.to_sym] = value.to_i
      else
        values[destination.to_sym] = values[value.to_sym]
      end
      input.rotate!
    when "inc"
      values[command[1].to_sym] += 1
      input.rotate!
    when "dec"
      values[command[1].to_sym] -= 1
      input.rotate!
    when "jnz"
      check_value = command[1]
      rotation = command[2].to_i
      case check_value
      when "a", "b", "c", "d"
        if values[check_value.to_sym] > 0
          input.rotate!(rotation)
        else
          input.rotate!
        end
      else
        input.rotate!(rotation)
      end
    else
      break
    end
  end
  values[:a]
end

def part_2_12(input)
  values = {a: 0, b: 0, c: 1, d: 0}
  loop do
    command = input[0].split
    case command[0]
    when "cpy"
      destination = command[2]
      value = command[1]
      if value.to_i > 0
        values[destination.to_sym] = value.to_i
      else
        values[destination.to_sym] = values[value.to_sym]
      end
      input.rotate!
    when "inc"
      values[command[1].to_sym] += 1
      input.rotate!
    when "dec"
      values[command[1].to_sym] -= 1
      input.rotate!
    when "jnz"
      check_value = command[1]
      rotation = command[2].to_i
      case check_value
      when "a", "b", "c", "d"
        if values[check_value.to_sym] > 0
          input.rotate!(rotation)
        else
          input.rotate!
        end
      else
        input.rotate!(rotation)
      end
    else
      break
    end
  end
  values[:a]
end
