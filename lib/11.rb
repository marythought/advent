# --- Day 11: Corporate Policy ---
#
# Santa's previous password expired, and he needs help choosing a new one.
#

def find_next(input)
  begin
    input = input.next
  end until valid?(input)
  input
end

def valid?(string)
  contains_triplet?(string) && no_bad_letters?(string) && doubles?(string)
end

def contains_triplet?(string)
  # Passwords must include one increasing straight of at least three letters,
  # like abc, bcd, cde, and so on, up to xyz. They cannot skip letters;
  # abd doesn't count.
  triplets = nil
  alphabet = ("a".."z").to_a
  alphabet_triplets = alphabet.each_with_index.map do |letter, index|
    [letter, alphabet[index + 1], alphabet[index + 2]].compact.join
  end.select{|triplet| triplet.length == 3}
  0.upto(string.length - 1) do |i|
    triplets = alphabet_triplets.include?(string[i..i+2]) ? true : false
    return true if triplets == true
  end
  return false
end

def no_bad_letters?(string)
  string.match(/[iol]/).nil?
end

def doubles?(string)
  # Passwords must contain at least two different, non-overlapping pairs
  # of letters, like aa, bb, or zz.
  string = string.split("")
  last = string.shift
  doubles = []
  while string.length > 0
    this_char = string.shift
    doubles << [last, this_char] if this_char == last
    last = this_char
  end
  doubles.uniq.length >= 2
end
