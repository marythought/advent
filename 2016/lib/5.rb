require 'digest'

def part_1_5(string)
  code = ""
  i = 0
  until code.length == 8
    md5 = Digest::MD5.new
    hex = md5.update(string + i.to_s)
    if hex.to_s[0..4] == "00000"
      code += hex.to_s[5]
    end
    i += 1
  end
  code
end

def part_2_5(string)
  code = {}
  i = 0
  until code.length == 8
    md5 = Digest::MD5.new
    hex = md5.update(string + i.to_s)
    if hex.to_s[0..4] == "00000"
      index = hex.to_s[5]
      character = hex.to_s[6]
      if index < "8" && index >="0" && !code[index]
        code[index] = character
      end
    end
    i += 1
  end
  code.sort.map{|k,v|v}.join
end
