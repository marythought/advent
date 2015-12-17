input = "Faerun to Norrath = 129
Faerun to Tristram = 58
Faerun to AlphaCentauri = 13
Faerun to Arbre = 24
Faerun to Snowdin = 60
Faerun to Tambi = 71
Faerun to Straylight = 67
Norrath to Tristram = 142
Norrath to AlphaCentauri = 15
Norrath to Arbre = 135
Norrath to Snowdin = 75
Norrath to Tambi = 82
Norrath to Straylight = 54
Tristram to AlphaCentauri = 118
Tristram to Arbre = 122
Tristram to Snowdin = 103
Tristram to Tambi = 49
Tristram to Straylight = 97
AlphaCentauri to Arbre = 116
AlphaCentauri to Snowdin = 12
AlphaCentauri to Tambi = 18
AlphaCentauri to Straylight = 91
Arbre to Snowdin = 129
Arbre to Tambi = 53
Arbre to Straylight = 40
Snowdin to Tambi = 15
Snowdin to Straylight = 99
Tambi to Straylight = 70"

destinations = {}

lines = input.each_line.map do |line|
  line.split(" = ").map do |entry|
    entry.strip
  end
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

      AlphaCentauri | Arbre | Faerun | Norrath | Snowdin | Straylight | Tambi | Tristram
AC        x
Ar                      x
Fae                              x
Nor                                       x
Snow                                                x
Stray                                                           x
Tam                                                                        x
Tri                                                                               x
