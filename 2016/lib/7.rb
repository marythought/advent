def part_1_7(input)
  num_TLS = 0
  input.each do |code|
    tls = false
    brackets = false
    bracket_stack_found = false
    stack = []
    bracket_stack = []
    code = code.chars
    while code.length > 0
      while brackets == true && !bracket_stack_found
        bracket_char = code.shift

        if bracket_char == "]"
          brackets = false
          bracket_stack = []
        else
          bracket_stack << bracket_char
        end

        if bracket_stack.length == 4
          if test_stack(bracket_stack)
            bracket_stack_found = true
            break
          else
            bracket_stack.shift
          end
        end
      end

      break if bracket_stack_found

      test_char = code.shift

      if test_char == "["
        stack = []
        brackets = true
      else
        stack << test_char
      end

      if stack.length == 4
        if test_stack(stack)
          tls = true
        else
          stack.shift
        end
      end unless brackets
    end

    if tls && !bracket_stack_found
      num_TLS += 1
    end
  end
  num_TLS
end

def test_stack(stack)
  (stack[0] == stack[3]) && (stack[1] == stack[2]) && (stack[0] != stack[1])
end

def part_2_7(input)
  num_SSL = 0
  input.each do |code|
    code = code.chars
    abas = []
    bracket_abas = []
    brackets = false
    while code.length > 2
      if brackets
        bracket_char = code.shift
        if bracket_char == "]"
          brackets = false
        else
          test_sequence = bracket_char + code[0] + code[1]
          if test_sequence[0] == test_sequence[2] && code[0] != "]" && bracket_char != code[0]
            bracket_abas << code[0] + bracket_char + code[0]
          end
        end
      else
        char = code.shift
        if char == "["
          brackets = true
        else
          test_sequence = char + code[0] + code[1]
          if test_sequence[0] == test_sequence[2] && code[0] != "[" && char != code[0]
            abas << test_sequence
          end
        end
      end
    end
    num_SSL += 1 if (abas & bracket_abas).length > 0
  end
  num_SSL
end
