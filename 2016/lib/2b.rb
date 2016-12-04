# 1 2 3
# 4 5 6
# 7 8 9

# [-1,1] [0,1] [1,1]
# [-1,0] [0,0] [1,0]
# [-1,-1][0,-1][1,-1]

def bathroom_code(input)
  x, y = [0, 0]

  number_pad = {
    1 => [-1, 1],
    2 => [0, 1],
    3 => [1, 1],
    4 => [-1, 0],
    5 => [0, 0],
    6 => [1, 0],
    7 => [-1, -1],
    8 => [0, -1],
    9 => [1, -1]
  }

  code = []

  input.each do |button|
    button.each_char do |char|
      if char == "U" && y < 1
        y += 1
      elsif char == "D" && y > -1
        y -= 1
      elsif char == "R" && x < 1
        x += 1
      elsif char == "L" && x > -1
        x -= 1
      end
    end
    code << number_pad.key([x, y])
  end
  code.join
end

#     1
#   2 3 4
# 5 6 7 8 9
#   A B C
#     D

#              [2,2]
#       [1,1]  [2,1] [3,1]
# [0,0] [1,0]  [2,0] [3,0] [4,0]
#       [1,-1] [2,-1][3,-1]
#              [2,-2]

#               [0,2]
#        [-1,1] [0,1] [1,1]
# [-2, 0][-1,0] [0,0] [1,0][2,0]
#        [-1,-1][0,-1][1,-1]
#               [0,-2]

def new_bathroom_code(input)
  wonky_number_pad = {
    1 => [0, 2],
    2 => [-1, 1],
    3 => [0, 1],
    4 => [1, 1],
    5 => [-2, 0],
    6 => [-1, 0],
    7 => [0, 0],
    8 => [1, 0],
    9 => [2, 0],
    "A" => [-1, -1],
    "B" => [0, -1],
    "C" => [1, -1],
    "D" => [0, -2]
  }
  new_code = []
  x, y = [-2, 0]
  input.each do |button|
    button.each_char do |char|
      if char == "U" && y < 1 && x.abs != 2
        y += 1
      elsif char == "U" && [x, y] == wonky_number_pad[3]
        y += 1
      elsif char == "D" && y > -1 && x.abs != 2
        y -= 1
      elsif char == "D" && [x, y] == wonky_number_pad["B"]
        y += 1
      elsif char == "R" && x < 1 && y.abs != 2
        x += 1
      elsif char == "R" && [x, y] == wonky_number_pad[8]
        x += 1
      elsif char == "L" && x > -1 && y.abs != 2
        x -= 1
      elsif char == "L" && [x, y] == wonky_number_pad[6]
        x -= 1
      end
    end
    new_code << wonky_number_pad.key([x, y])
  end
  new_code.join
end
