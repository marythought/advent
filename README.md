# Advent of Code 2015

## To Test:
* `bundle install`
* `rake test`

## Progress
### TODO:
* 8 part 2 (reverse string engineering)
* 9 (traveling salesperson problem)
* 10 part 2 (byteslicing)
* 11 (santa's password)
* 12 (JSON parsing)
* 13 (seating chart)
* 14 (reindeer olympics)
* 15 (cookie science)
* 17 (eggnog containers)
* 18 (moar grid lights)
* 19 (medicine molecule mutations)
* 20 (infinite elf present delivery)
* 21 (RPG generator)
* 22 (more RPG stuff)
* 23 (Turing problem)
* 24 ("quantum entanglement" wtf)

### Completed:
* 1 - 7
* 8 part 1
* 10 part 1
* 16

## Day 1
To find what floor Santa needs to go to, I converted the string input to an array and reversed it to create a heap. I'm then popping off the values, adding or subtracting to floors depending on the value, until the heap is empty. The function returns an integer with the end value of floor.

For the second part of the question, I iterate over the array with index and return the index as soon as floor becomes negative. This gives the position at which Santa enters the basement.

## Day 2
For the wrapping paper problem, I accept the input as a string and split it into an array. I then iterate over the array, assigning length, width, and height to each box (values sorted smallest to largest), and calculating the paper (or ribbon) needed.

## Day 3
To find which houses Santa has visited, I start by declaring an array of arrays "delivered" (a grid) at his current location. I then shift off his next move and save that new location in delivered. When he's done, I call the length of unique records in delivered for a house count.

In the second question, I use a similar function but store Santa's locations and his robot's locations separately. I also created a new function get_move to DRY the move logic for both Santa and Robo Santa.

## Day 4
For this MD5 hash question I used Ruby's "digest" module and am testing every MD5 hash of the input string plus an integer and returning when I hit the lowest integer that begins with "00000" (or "000000" for the second half of the problem).

## Day 5
This question analyzes a series of strings for regex matching and uses santa's logic to declare them "naughty" or "nice."

## Day 6
For the lights question, I created a Grid class that is initialized with a size and empty hash of lights, which is then populated with key, value pairs of the grid location and a boolean indicating "on" or "off". I prepare the input by slicing it into manageable pieces and then getting the range for the light input and setting the value of those key, value pairs to "on" or "off" based on the command. The final count_lights method counts how many lights have a value of "on."

Part 2 is the same Grid object, with the methods adjusted to account for new information and a light brightness.

## Day 7
For the bitwise logic gates question, I created a Toy object that instantiates with an empty hash of wires. To populate, it parses an input string and saves it as hash of wire => command. To find the value of a wire, we call a recursive find_value method that completes the appropriate bitwise operations and saves the value of a wire as numbers are returned.

In part 2, we set the value of b to the return value of a and run the find_value method again to get a new value for wire a.

## Day 8
This string chasing was pretty painful to do in Ruby. I keep a running count of characters in code vs characters in memory and manually convert the incoming strings to remove / process escaped text. I can't bear to tackle part 2 yet.

## Day 9
That's a nope.

## Day 10
I originally took the input integer and turned it into an array of string number characters. This worked but took too long, and I found a hint to try byteslicing instead. I created a function to perform "look say" on the numbers that searches through each number string, tracking the last number to see if it matches the next number. When a match is found, the count increases. When there's no match, the count followed by the integer is added to the result string. I then run this function 40 times (first part: working) and an additional 10 times (second part: still too slow! not working).

## Day 16
This is pretty ugly but I couldn't resist the opportunity to create a class Sue. Both assigning Sue's attributes and finding if she's a match desperately want for refactoring.
