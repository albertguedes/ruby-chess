require_relative 'display.rb'
require_relative 'piece.rb'
require_relative 'pawn'
require_relative 'sliding'
require_relative 'stepping'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'
require_relative 'king'
require_relative 'queen'


class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    populate_grid
  end

  def populate_grid
    # 0.upto(8) do |i|
    @grid.each_index do |i|
      if i == 0 || i == 7
        @grid[0][i] = Rook.new(:black, @grid, [0,i])
        @grid[7][i] = Rook.new(:white, @grid, [7,i])
      elsif i == 1 || i == 6
        @grid[0][i] = Knight.new(:black, @grid, [0,i])
        @grid[7][i] = Knight.new(:white, @grid, [7,i])
      elsif i == 2 || i == 5
        @grid[0][i] = Bishop.new(:black, @grid, [0,i])
        @grid[7][i] = Bishop.new(:white, @grid, [7,i])
      elsif i == 3
        @grid[0][i] = Queen.new(:black, @grid, [0,i])
        @grid[7][i] = Queen.new(:white, @grid, [7,i])
      else
        @grid[0][i] = King.new(:black, @grid, [0,i])
        @grid[7][i] = King.new(:white, @grid, [7,i])
      end
    end
    @grid[1].each_index do |i|
      @grid[1][i] = Pawn.new(:black, @grid, [1,i])
      @grid[6][i] = Pawn.new(:white, @grid, [6,i])
    end
  end

  def move(start, end_pos, color)
    start_row, start_col = start
    moving_piece = @grid[start_row][start_col]
    if moving_piece.nil? || moving_piece.color != color
      raise ArgumentError
    end

    possible_moves = moving_piece.possible_moves
    raise ArgumentError unless possible_moves.include?(end_pos)

    end_row, end_col = end_pos
    @grid[end_row][end_col] = moving_piece
    moving_piece.pos = end_pos
    @grid[start_row][start_col] = nil
  end

  def in_bounds?(move)
    x, y = move
    return true if x.between?(0, 7) && y.between?(0, 7)
    false
  end

end
