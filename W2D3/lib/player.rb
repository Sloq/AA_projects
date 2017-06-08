class Player
  attr_reader :pot, :name, :hand, :in_game
  def initialize(name, hand, pot)
    @hand = hand
    @name = name
    @pot = pot
    @in_game = true
  end

  def take_turn
    # returns :see, :fold, :raise
  end

  def place_bet(bet = get_bet)
    @pot -= bet
    bet
  end

  def get_bet
    puts "how much you wanna bet"
    gets.chomp.to_i
  end

  def discard_card(discards = get_discard_card)
    @hand.cards.reject! {|card| discards.include?(@hand.cards.index(card))}
  end

  def get_discard_card
    puts "which card/cards would you like to discard"
    gets.chomp.split(",").map(&:to_i)
  end

  def fold
    @in_game = false
  end

  def win_hand(global_pot)
    @pot += global_pot
  end





end
