require_relative 'card'

class Deck
  attr_reader :deck
  def initialize
    @deck = []
    deck_maker
  end

  def deck_maker
    (2..14).each do |value|
      [:c, :h, :d, :s].each do |suite|
        @deck << Card.new(value, suite)
      end
    end
  end

  def shuffle
    @deck.shuffle!
  end

  def deal(n = 1)
    arr = []
    n.times { arr << @deck.pop }
    @dealt = arr
  end

  def collect
    @deck += @dealt
    @dealt = []
  end
end
