class Screen
  def initialize
    @board = []
    load_board
  end

  def rotate_row(index, amt)
    @board[index].rotate!(-amt)
  end

  def rotate_column(index, amt)
    @board = @board.transpose
    rotate_row(index, amt)
    @board = @board.transpose
  end

  def rect(width, height)
    width.times do |w|
      height.times do |h|
        @board[h][w] = "#"
      end
    end
  end

  def lit
    @board.flatten.count("#")
  end

  private

  def load_board
    6.times do
      @board << Array.new(50, ".")
    end
  end
end

def part_1_8(input)
  board = Screen.new
  input.each do |command|
    if command.include?("rotate column")
      index = command.match(/x=(\d+) by (\d+)/)[1].to_i
      amt = command.match(/x=(\d+) by (\d+)/)[2].to_i
      board.rotate_column(index, amt)
    elsif command.include?("rotate row")
      index = command.match(/y=(\d+) by (\d+)/)[1].to_i
      amt = command.match(/y=(\d+) by (\d+)/)[2].to_i
      board.rotate_row(index, amt)
    elsif command.include?("rect")
      w = command.match(/(\d*)x(\d*)/)[1].to_i
      h = command.match(/(\d*)x(\d*)/)[2].to_i
      board.rect(w, h)
    end
  end
  board.lit
end

def part_2_8(input)
  board = Screen.new
  input.each do |command|
    if command.include?("rotate column")
      index = command.match(/x=(\d+) by (\d+)/)[1].to_i
      amt = command.match(/x=(\d+) by (\d+)/)[2].to_i
      board.rotate_column(index, amt)
    elsif command.include?("rotate row")
      index = command.match(/y=(\d+) by (\d+)/)[1].to_i
      amt = command.match(/y=(\d+) by (\d+)/)[2].to_i
      board.rotate_row(index, amt)
    elsif command.include?("rect")
      w = command.match(/(\d*)x(\d*)/)[1].to_i
      h = command.match(/(\d*)x(\d*)/)[2].to_i
      board.rect(w, h)
    end
  end
  p board
end
