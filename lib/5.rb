# --- Day 5: Doesn't He Have Intern-Elves For This? ---
#
# Santa needs help figuring out which strings in his text file are naughty
# or nice. A nice string is one with all of the following properties:
#
# How many strings are nice?

def nice_strings(input)
  strings = input.split("\n").map(&:strip)
  nice_count = 0
  strings.each do |string|
    twinsy = twinsies(string)
    vowel_count = get_vowel_count(string)
    nice_count += 1 if !illegal(string) && vowel_count > 2 && twinsy == true
  end
  nice_count
end

# It does not contain the strings ab, cd, pq, or xy, even if they are part of
# one of the other requirements.

def illegal(string)
  string.match(/^((?!ab|cd|pq|xy).)*$/).nil?
end

# It contains at least three vowels (aeiou only), like aei, xazegov, or
# aeiouaeiouaeiou.

def get_vowel_count(string)
  vowels = ["a","e", "i", "o", "u"]
  vowel_count = 0
  string.each_char do |char|
    vowel_count += 1 if vowels.include?(char)
  end
  vowel_count
end

# It contains at least one letter that appears twice in a row, like xx,
# abcdde (dd), or aabbccdd (aa, bb, cc, or dd).

def twinsies(string)
  last_char = ""
  string.each_char do |char|
    return true if char == last_char
    last_char = char
  end
  false
end

# Now, a nice string is one with all of the following properties:

def nicer_strings(input)
  strings = input.split("\n").map(&:strip)
  nice_count = 0
  strings.each do |string|
    match = match?(string)
    triplets = triplets?(string)
    nice_count += 1 if match && triplets
  end
  nice_count
end

def get_bigrams(string)
  bigrams = []
  0.upto(string.length - 2) do |i|
    bigrams << [string[i], string[i + 1]]
  end
  bigrams
end

# It contains a pair of any two letters that appears at least twice in the
# string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not
# like aaa (aa, but it overlaps).

def match?(string)
  bigrams = get_bigrams(string)
  while bigrams.length > 1
    pair = bigrams.shift
    return true if bigrams[1..-1].include?(pair)
  end
end

# It contains at least one letter which repeats with exactly one letter
# between them, like xyx, abcdefeghi (efe), or even aaa.

def triplets?(string)
  bigrams = get_bigrams(string)
  bigrams.each_with_index do |bigram, index|
    return false if index == bigrams.length - 1
    return true if bigram[0] == bigrams[index + 1][1]
  end
  false
end
