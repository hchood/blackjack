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

# PLAYER's TURN

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

# DEALER's TURN

# As a dealer
# I want to continue hitting until my score is at least 17
# So that I get close to 21 without too much risk of busting.
# Acceptance Criteria:

# While the dealer's best possible hand is below 17, continue hitting.
# If the dealer's lowest score exceeds 21, output Bust! You win!.

2.times do
  deck.deal_card(dealer_hand)
end

dealer_hand.output_score

until dealer_hand.score >= 17
  deck.deal_card(dealer_hand)
  dealer_hand.output_score
end

puts "Dealer stands.\n\n"

if dealer_hand.score > 21 || player_hand.score > dealer_hand.score
  puts "You win!"
else
  puts "You lose."
end
