require "colorize"
require_relative "cursorable"

class Display
  include Cursorable

  attr_accessor :cursor_pos, :board

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      if piece.nil?
        "   ".colorize(color_options)
      else
       piece.to_s.colorize(color_options)
     end
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :brown
    else
      bg = :black
    end
    { background: bg, color: :white }
  end

  def render
    system("clear")
    puts "Arrow keys or WASD to move, space or enter to confirm."

    build_grid.each { |row| puts row.join }
  end

  def get_move(color)
    result = nil
    until result
      render
      puts "#{color}'s move"
      result = get_input
    end

    result
  end
end
