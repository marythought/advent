input = IO.readlines("8.txt")

chars_in_code = 0
chars_in_memory = 0

input.each do |line|
  line.chomp!
  print line + " : "
  puts line.length
  chars_in_code += line.length # all chars
  new_line = line[1..-2] # remove end quotes
  new_line = new_line.gsub(/\\x\w\w/, '\'').gsub(/\\"/, '"' ).gsub(/\\\\/, '\\')# find and replace \" with " and \\ with \
  print new_line + " : "
  puts new_line.length
  chars_in_memory += new_line.length
end

puts chars_in_code - chars_in_memory

# 600 too low
# 1339 too high
