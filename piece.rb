
class Piece

  attr_accessor :pos
  attr_reader :color

  def initialize(color, grid, pos)
    @color = color
    @grid = grid
    @pos = pos
  end

  def present?
    true
  end

  def valid_move?(move)
    x, y = move
    return true if @grid[x][y] == nil
    return false if @grid[x][y].color == @color
    true
  end

  def kills?(position)
    x,y = position

    if @grid[x][y]
      return true if @grid[x][y].color != @color
    end
    false

  end

  def inbounds?(move)
    x, y = move
    return true if x.between?(0, 7) && y.between?(0, 7)
    false
  end

  def change_position(move)
    @pos = move
  end

end
