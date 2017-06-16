require_relative 'deck'
require_relative 'card'

class Hand
  attr_accessor :cards

  def initialize(player)
    @player = player
    @cards = []
  end

  def take(cards)
    @cards << cards unless cards.is_a? Array
    @cards += cards
  end

  def score
    return straight_flush if straight_flush
    return four_of_a_kind if four_of_a_kind
    return full_house if full_house
    return straight if straight
    return three_of_a_kind if three_of_a_kind
    return flush if flush
    return two_pair if two_pair
    return one_pair if one_pair
    return high_card if high_card
  end

  private
  def straight_flush
    return false unless @cards.all? { |x| x.suite == @cards[0].suite }
    return false unless @cards.max_by { |x| x.value }.value - @cards.min_by { |x| x.value }.value == 4
    100**9 + @cards.reduce(0) { |acc, x| acc + x.value }
  end

  def flush
    return false unless @cards.all? {|x| x.suite == @cards[0].suite }
    100**6 + @cards.reduce(0) {|acc, x| acc + x.value }
  end

  def four_of_a_kind
    val_arr = @cards.map {|one_card| one_card.value}
    return false unless val_arr.any? {|x| val_arr.count(x) == 4 }
    100**8 + @cards.reduce(0) {|acc, x| acc + x.value }
  end

  def full_house
    val_arr = @cards.map {|one_card| one_card.value}
    return false unless val_arr.all? {|x| [2,3].include?(val_arr.count(x))}
    100**7 + val_arr.select {|value| val_arr.count(value) == 3}.reduce(:+)
  end

  def straight
    return false unless @cards.max_by { |x| x.value }.value - @cards.min_by { |x| x.value }.value == 4
    100**5 + @cards.reduce(0) {|acc, x| acc + x.value }
  end

  def three_of_a_kind
    val_arr = @cards.map {|one_card| one_card.value}
    return false unless val_arr.any? {|x| val_arr.count(x) == 3 }
    100**4 + @cards.reduce(0) {|acc, x| acc + x.value }
  end

  def two_pair
    hsh = Hash.new(0)
    @cards.each { |card| hsh[card.value] += 1 }
    return false unless hsh.values.sort == [1,2,2]
    100**3 + @cards.reduce(0) {|acc, x| acc + x.value }
  end

  def one_pair
    val_arr = @cards.map { |x| x.value }
    return false unless val_arr.any? { |x| val_arr.count(x) > 1 }
    100**2 + @cards.reduce(0) {|acc, x| acc + x.value }
  end

  def high_card
    @cards.reduce(100) {|acc, x| acc + x.value } 
  end

end
