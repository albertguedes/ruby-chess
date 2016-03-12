class Rook < Sliding

  def possible_moves
    dir = :straight
    super(dir)

  end

  def to_s
    " ♜ "
  end

end
