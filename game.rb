require_relative 'board'
require_relative 'display'
require 'byebug'


class Game

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @current_player = :white
  end

  def over?
    @board.over?
  end

  def play
    until over?
      begin
        pos_1 = @display.get_move(@current_player)
        pos_2 = @display.get_move(@current_player)
        @board.move(pos_1, pos_2, @current_player)
      rescue ArgumentError
        puts "Invalid move. Please try again."
        sleep(0.7)
        retry
      end

      @current_player = @current_player == :white ? :black : :white
    end
    puts @board.message
  end

end


g = Game.new
g.play
