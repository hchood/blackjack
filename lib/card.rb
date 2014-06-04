class Card
  attr_reader :suit, :rank

  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def value
    if face_card?
      10
    elsif ace?
      11
    else
      rank
    end
  end

  def face_card?
    true if rank == 'J' || rank == 'Q' || rank == 'K'
  end

  def ace?
    true if rank == 'A'
  end
end
