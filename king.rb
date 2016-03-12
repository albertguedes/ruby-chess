
class King < Stepping

  def to_s
    " ♚ "
  end

  def possible_moves
    super(:king)
  end

end
