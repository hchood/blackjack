require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = self.build_deck
  end

  def build_deck
    cards = []

    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        cards << Card.new(suit, rank)
      end
    end

    cards.shuffle
  end
end
