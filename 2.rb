# --- Day 2: I Was Told There Would Be No Math ---
#
# The elves are running low on wrapping paper, and so they need to submit an order for more. They have a list of the dimensions (length l, width w, and height h) of each present, and only want to order exactly as much as they need.
#
# Fortunately, every present is a box (a perfect right rectangular prism), which makes calculating the required wrapping paper for each gift a little easier: find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l. The elves also need a little extra paper for each present: the area of the smallest side.


input = IO.read("inputs/2.txt").chomp!

def calculate_paper(string)
  array = string.split("\n")
  feet = 0
  array.each do | box |
    l, w, h = box.split("x").map{ | i | i.to_i}.sort
    extra = l * w
    this_box = (2 * l * w) + (2 * w * h) + (2 * h * l) + extra
    feet += this_box
  end
  feet
end

puts calculate_paper(input)

# --- Part Two ---
#
# The elves are also running low on ribbon. Ribbon is all the same width, so they only have to worry about the length they need to order, which they would again like to be exact.
#
# The ribbon required to wrap a present is the shortest distance around its sides, or the smallest perimeter of any one face. Each present also requires a bow made out of ribbon as well; the feet of ribbon required for the perfect bow is equal to the cubic feet of volume of the present. Don't ask how they tie the bow, though; they'll never tell.

def calculate_ribbon(string)
  array = string.split("\n")
  feet = 0
  array.each do | box |
    l, w, h = box.split("x").map{ | i | i.to_i}.sort
    ribbon = (2 * l + 2 * w) + (l * w * h)
    feet += ribbon
  end
  feet
end

puts calculate_ribbon(input)
