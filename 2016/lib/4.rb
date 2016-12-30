# A room is real (not a decoy) if the checksum is the five most common letters in the encrypted name, in order, with ties broken by alphabetization. For example:
#
# aaaaa-bbb-z-y-x-123[abxyz] is a real room because the most common letters are a (5), b (3), and then a tie between x, y, and z, which are listed alphabetically.
# a-b-c-d-e-f-g-h-987[abcde] is a real room because although the letters are all tied (1 of each), the first five are listed alphabetically.
# not-a-real-room-404[oarel] is a real room.
# totally-real-room-200[decoy] is not.

def part_1_4(input) # aaaaa-bbb-z-y-x-123[abxyz]
  sum = 0
  valid_rooms = []
  input.each do |code|
    dict = {}
    code = code.split("")
    code.pop
    checksum = []
    5.times do
      checksum << code.pop
    end
    checksum = checksum.join.reverse
    code.pop
    room_name = code.join
    serial_num = code.select { |char| char.match(/[\d]/) }.join
    code = code.select{ |char| !char.match(/[\d]/) } #[aaaaa-bbb-z-y-x-]
    code.delete("-") # ["a", "a", "a", "a", "a", "b", "b", "b", "z", "y", "x"]
    code.each do |char|
      if dict[char]
        dict[char] += 1
      else
        dict[char] = 1
      end
    end
    check_checksum = []
    until check_checksum.length >= 5
      if dict.select { |k, v| v == dict.values.max }.length == 1
        check_checksum << dict.max_by{ |k, v| v }[0]
        dict.delete(dict.max_by{ |k, v| v }[0]) # ["s", 6]
      else
        highest = dict.select { |_k, v| v == dict.values.max }.sort
        highest.each do |value|
          check_checksum << value[0]
          dict.delete(value[0])
        end
      end
    end
    if checksum == check_checksum.join[0..4]
      sum += serial_num.to_i
      valid_rooms << [room_name, serial_num]
    end
  end
  [sum, valid_rooms]
end

def part_2_4(input)
  valid_rooms = part_1_4(input)[1]
  valid_rooms.map do |room|
    # ["vkrhzxgbv-wrx-phkdlahi-215", "215"]
    room[0].each_char.map do |char|
      if char == "-"
        " "
      elsif char.match(/[\d]/)
        char
      else
        room[1].to_i.times do
          char = char.next[0]
        end
        char
      end
    end
  end.join.match(/northpole \S+ \S+ (\d{3})/)[1]
end
