
class Knight < Stepping

  def to_s
    if @color == :white 
      " ♘ "
    else
      " ♞ "
    end
  end

  def possible_moves
    super(:knight)
  end

end
