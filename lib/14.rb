# --- Day 14: Reindeer Olympics ---
#
# This year is the Reindeer Olympics! Reindeer can fly at high speeds, but must
# rest occasionally to recover their energy. Santa would like to know which
# of his reindeer is fastest, and so he has them race.
#
# Reindeer can only either be flying (always at their top speed) or resting
# (not moving at all), and always spend whole seconds in either state.

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
    input = input.map { |line| line.split(" can fly ") }
    input = input.map { |line| [line[0], line[-1].split(/\D/)] }.flatten
    input.delete("")
    while input.length > 0
      reindeer = Reindeer.new(input.shift, input.shift, input.shift, input.shift)
      @racers << reindeer
    end
  end

  def find_lead
    reindeer_positions = {}
    @racers.each do |reindeer|
      reindeer_positions[reindeer] = reindeer.track.find_reindeer_index
    end
    @lead = reindeer_positions.map { |k, v| k if v == reindeer_positions.values.max }.compact
  end

  def run_race
    @time.times do
      @racers.each do |reindeer|
        reindeer.track.advance_reindeer
      end
    end
    @racers.map { |reindeer| reindeer.track.find_reindeer_index }.sort[-1]
  end

  # Seeing how reindeer move in bursts, Santa decides he's not pleased with the
  # old scoring system.
  # Instead, at the end of each second, he awards one point to the reindeer
  # currently in the lead. (If there are multiple reindeer tied for the lead,
  # they each get one point.) He keeps the traditional 2503 second time limit,
  # of course, as doing otherwise would be entirely ridiculous.

  def run_race_with_points
    @time.times do
      @racers.each { |reindeer| reindeer.track.advance_reindeer }
      find_lead
      @lead.each { |reindeer| reindeer.points += 1 }
    end
    @racers.map { |reindeer| reindeer.points }.sort[-1]
  end
end
