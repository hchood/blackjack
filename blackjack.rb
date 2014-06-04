require 'pry'

require_relative 'lib/deck'

# As a dealer
# I want to initially deal out two cards to the current player
# So that we can begin the game

# Acceptance Criteria:

# Cards are dealt from a shuffled deck of 52 cards.
# Output Player was dealt CARD for each card the player receives.
# Output Dealer was dealt CARD for each card the dealer receives.

# CREATE DECK AND HANDS

deck = Deck.new

player_hand = Hand.new
dealer_hand = Hand.new

# DEAL INITIAL HAND

[player_hand, dealer_hand].each do |hand|
  2.times do
    deck.deal_card(hand)
  end
end


