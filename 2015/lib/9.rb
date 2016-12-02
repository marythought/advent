input = IO.read("inputs/9.txt").chomp!

destinations = {}

input.each_line.map do |line|
  line.split(" = ").map(&:strip)
end.each do |line|
  line[0] = line[0].split(" to ").sort.join(", ")
  destinations[line[0]] = line[1]
end

puts destinations.each_key.sort
puts destinations

destination_array = destinations.sort
# [["AlphaCentauri, Arbre", "116"], ["AlphaCentauri, Faerun", "13"], ["AlphaCentauri, Norrath", "15"], ["AlphaCentauri, Snowdin", "12"], ["AlphaCentauri, Straylight", "91"], ["AlphaCentauri, Tambi", "18"], ["AlphaCentauri, Tristram", "118"], ["Arbre, Faerun", "24"], ["Arbre, Norrath", "135"], ["Arbre, Snowdin", "129"], ["Arbre, Straylight", "40"], ["Arbre, Tambi", "53"], ["Arbre, Tristram", "122"], ["Faerun, Norrath", "129"], ["Faerun, Snowdin", "60"], ["Faerun, Straylight", "67"], ["Faerun, Tambi", "71"], ["Faerun, Tristram", "58"], ["Norrath, Snowdin", "75"], ["Norrath, Straylight", "54"], ["Norrath, Tambi", "82"], ["Norrath, Tristram", "142"], ["Snowdin, Straylight", "99"], ["Snowdin, Tambi", "15"], ["Snowdin, Tristram", "103"], ["Straylight, Tambi", "70"], ["Straylight, Tristram", "97"], ["Tambi, Tristram", "49"]]

this_listing = destination_array.shift
start_city, destination_city = this_listing[0].split(", ")

#       AlphaCentauri | Arbre | Faerun | Norrath | Snowdin | Straylight | Tambi | Tristram
# AC        x
# Ar                      x
# Fae                              x
# Nor                                       x
# Snow                                                x
# Stray                                                           x
# Tam                                                                        x
# Tri                                                                               x
