class BingoGrid
  def self.setup_board(input)
    grid = Array.new(5) { Array.new }
    input.each_with_index do |row, idx|
      row.split("\s").each do |val|
        grid[idx] << Square.new(val.to_i)
      end
    end
    new(grid)
  end

  def initialize(grid)
    @grid = grid
  end

  def play_number(num)
    squares = grid.flatten.select { |square| square.value == num }
    squares.each(&:mark)
  end

  def winner?
    0.upto(4).any? do |row|
      (0..4).all? { |col| grid[col][row].marked? } ||
        (0..4).all? { |col| grid[row][col].marked? }
    end
  end

  def score(final_number)
    grid.flatten.sum do |square|
      if square.marked?
        0
      else
        square.value
      end
    end * final_number
  end

  def [](row, col)
    if row > 4 || col > 4
      raise "OUT OF BOUNDS! row: #{row} col: #{col}"
    end
    grid[row][col]
  end

  attr_reader :grid
end

class Square
  def initialize(value)
    @value = value
    @marked = false
  end

  def mark
    @marked = true
  end

  def marked?
    marked == true
  end

  attr_reader :value, :marked
end

if __FILE__ == $PROGRAM_NAME
  input = File.readlines("inputs/day_4/input.txt").map(&:strip)
  game_numbers = input.first
  bingo_boards = []
  new_grid = []
  input.each_with_index do |el, idx|
    next if idx == 0 || idx == 1
    new_grid << el unless el.empty?
    if el.empty? || idx == input.length - 1
      bingo_boards << BingoGrid.setup_board(new_grid)
      new_grid = []
    end
  end

  first_winner = nil
  first_winner_num = nil
  final_winner = nil
  final_winner_num = nil
  game_numbers.split(",").map(&:to_i).each do |num|
    winners = bingo_boards.select(&:winner?)
    next if winners.length == bingo_boards.length
    bingo_boards.each do |board|
      board.play_number(num) unless board.winner?
    end
    winners = bingo_boards.select(&:winner?)
    if winners.length == bingo_boards.length && final_winner_num.nil?
      final_winner_num = num
    end
    if winners.any? && first_winner.nil?
      first_winner = winners.first
      first_winner_num = num
    end
    if winners.length == bingo_boards.length - 1 && final_winner.nil?
      final_winner = bingo_boards.reject(&:winner?).first
    end
  end
  puts "First winning score is #{first_winner.score(first_winner_num)}"
  puts "Last winning score is #{final_winner.score(final_winner_num)}"
end
