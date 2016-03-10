require_relative 'board'
require_relative 'display'


class Game

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @current_player = :white
  end

  def play
    puts "Beginning of game. White moves first."
    while true
      begin
        puts "#{@current_player}'s move"
        pos_1 = @display.get_move(@current_player)
        pos_2 = @display.get_move(@current_player)
        @board.move(pos_1, pos_2, @current_player)
      rescue ArgumentError
        puts "Invalid move. Please try again."
        sleep(1)
        retry
      end
      

      if @current_player == :white
        @current_player = :black
      else
        @current_player = :white
      end
    end
  end

end


g = Game.new
g.play
