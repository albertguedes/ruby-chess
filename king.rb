
class King < Stepping

  def to_s
    if @color == :white 
      " ♔ "
    else
      " ♚ "
    end
  end

  def possible_moves
    super(:king)
  end

end
