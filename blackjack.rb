require 'pry'

require_relative 'lib/deck'

# As a dealer
# I want to initially deal out two cards to the current player
# So that we can begin the game

# Acceptance Criteria:

# Cards are dealt from a shuffled deck of 52 cards.
# Output Player was dealt CARD for each card the player receives.
# Output Dealer was dealt CARD for each card the dealer receives.

puts "Welcome to Blackjack!\n\n"

# CREATE DECK AND HANDS

deck = Deck.new

player_hand = Hand.new('Player')
dealer_hand = Hand.new('Dealer')

# DEAL INITIAL HAND TO PLAYER

2.times do
  deck.deal_card(player_hand)
end

player_hand.output_score

# ASK TO HIT OR STAND

choice = nil

until choice == 's'
  # ask if player wants to hit or stand
  print "Hit or stand (H/S): "
  choice = gets.chomp.downcase
  puts

  # output score
  if choice == 's'
    player_hand.output_score
  elsif choice == 'h'
    deck.deal_card(player_hand)
    player_hand.output_score
  else
    puts "I'll take that as a stand."
    player_hand.output_score
  end

  # if over 21, put 'Bust' and exit program
  if player_hand.score > 21
    puts "Bust! You lose..."
    exit
  end
end

