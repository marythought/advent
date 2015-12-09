require 'open-uri'

url = "http://adventofcode.com/day/2/input"

open(url) { |f|  #url must specify the protocol
  str = f.read()
}

puts str
