class Hand
  attr_reader :player, :cards

  def initialize(player_name)
    @player = player_name
    @cards = []
  end

  def output_score
    puts "#{player}: #{score}\n\n"
  end

  def score
    total = 0

    cards.each do |card|
      total += card.value
    end

    if ace_count > 1
      total -= 10 * (ace_count - 1)
    end

    total
  end

  def ace_count
    count = 0

    cards.each do |card|
      count += 1 if card.ace?
    end

    count
  end
end
