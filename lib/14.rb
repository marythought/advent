# --- Day 14: Reindeer Olympics ---
#
# This year is the Reindeer Olympics! Reindeer can fly at high speeds, but must rest occasionally to recover their energy. Santa would like to know which of his reindeer is fastest, and so he has them race.
#
# Reindeer can only either be flying (always at their top speed) or resting (not moving at all), and always spend whole seconds in either state.
#
# For example, suppose you have the following Reindeer:
#
# Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
# Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
# After one second, Comet has gone 14 km, while Dancer has gone 16 km. After ten seconds, Comet has gone 140 km, while Dancer has gone 160 km. On the eleventh second, Comet begins resting (staying at 140 km), and Dancer continues on for a total distance of 176 km. On the 12th second, both reindeer are resting. They continue to rest until the 138th second, when Comet flies for another ten seconds. On the 174th second, Dancer flies for another 11 seconds.
#
# In this example, after the 1000th second, both reindeer are resting, and Comet is in the lead at 1120 km (poor Dancer has only gotten 1056 km by that point). So, in this situation, Comet would win (if the race ended at 1000 seconds).
#
# Given the descriptions of each reindeer (in your puzzle input), after exactly 2503 seconds, what distance has the winning reindeer traveled?
#

input = IO.readlines("inputs/14.txt")

class Reindeer
  attr_accessor :name, :distance, :fly_time, :rest_time, :track, :points

  def initialize(name, distance, fly_time, rest_time)
    @name = name
    @distance = distance.to_i
    @fly_time = fly_time.to_i
    @rest_time = rest_time.to_i
    @track = Track.new(self)
    @points = 0
  end
end

class Track
  attr_accessor :reindeer, :kilometers

  def initialize(reindeer)
    @reindeer = reindeer
    @kilometers = ("x" * 5000).split("")
    @flying = true
    @resting = false
    @time_elapsed_in_state = 0
    start_reindeer
  end

  def start_reindeer
    @kilometers[0] = reindeer
  end

  def advance_reindeer
    # one second at a time
    if @flying
      old_position = @kilometers.index(@reindeer)
      @kilometers[old_position + @reindeer.distance] = @reindeer
      @kilometers[old_position] = "x"
      @time_elapsed_in_state += 1
      if @time_elapsed_in_state == @reindeer.fly_time
        @flying = false
        @resting = true
        @time_elapsed_in_state = 0
      end
    elsif @resting
      @time_elapsed_in_state += 1
      if @time_elapsed_in_state == @reindeer.rest_time
        @flying = true
        @resting = false
        @time_elapsed_in_state = 0
      end
    end
  end

  def find_reindeer_index
    @kilometers.index(@reindeer)
  end
end

class Race
  def initialize(time, input)
    @time = time
    @racers = []
    @lead = nil
    register_racers(input)
  end

  def register_racers(input)
    input = input.map{|line| line.split(" can fly ")}
    input = input.map{|line| [line[0], line[-1].split(/\D/)]}.flatten
    input.delete("")
    while input.length > 0 do
      reindeer = Reindeer.new(input.shift, input.shift, input.shift, input.shift)
      @racers << reindeer
    end
  end

  def find_lead
    reindeer_positions = {}
    @racers.each do |reindeer|
      reindeer_positions[reindeer] = reindeer.track.find_reindeer_index
    end
    @lead = reindeer_positions.map{ |k, v| k if v == reindeer_positions.values.max }.compact
  end

  def run_race
    @time.times do
      @racers.each do |reindeer|
        reindeer.track.advance_reindeer
      end
    end
    @racers.map { |reindeer| reindeer.track.find_reindeer_index }.sort[-1]
  end

  # Seeing how reindeer move in bursts, Santa decides he's not pleased with the old scoring system.
  # Instead, at the end of each second, he awards one point to the reindeer currently in the lead. (If there are multiple reindeer tied for the lead, they each get one point.) He keeps the traditional 2503 second time limit, of course, as doing otherwise would be entirely ridiculous.

  def run_race_with_points
    @time.times do
      @racers.each { |reindeer| reindeer.track.advance_reindeer }
      find_lead
      @lead.each { |reindeer| reindeer.points += 1 }
    end
    @racers.map { |reindeer| reindeer.points }.sort[-1]
  end
end
