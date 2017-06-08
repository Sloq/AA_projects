require 'rspec'
require 'hand'


describe 'Hand' do
  let(:our_deck) {Deck.new}
  let(:player) { double('player', name: 'player') }
  let(:hand) { Hand.new(player) }

  describe 'init'
  it 'starts with an empty hand' do
    expect(hand.cards.size).to eq(0)
  end

  describe '.take'
  it 'takes an amount of cards from the deck' do
    deck = [Card.new(3, :s), Card.new(7, :h)]
    hand.take(deck)
    expect(hand.cards.size).to eq(2)
  end

  describe 'hands'

  it 'calculates the value of a straight flush' do
    deck = our_deck.deck.dup
    deck.select! { |x| x.suite == :c }
    deck.select! { |x| x.value > 9 }
    hand.cards = deck
    expect(hand.score).to eq((100**9) + 60)
  end

  it 'calculates the value of a flush' do
    deck = our_deck.deck.dup
    deck.select! { |x| x.suite == :c }
    deck.select! { |x| [14, 12, 10, 8, 6].include? x.value }
    hand.cards = deck
    expect(hand.score).to eq((100**6) + [14, 12, 10, 8, 6].reduce(:+))
  end

  it 'calculates the value of a four of a kind' do
    deck = our_deck.deck.dup
    deck.select! { |x| x.value == 5 }
    hand.cards = deck
    expect(hand.score).to eq((100**8) + (5 * 4))
  end

  it 'calculates the value of a full house' do
    deck = our_deck.deck.dup.select! { |x| x.value == 10 }
    deck.pop
    fives = our_deck.deck.dup.select { |x| x.value == 5 }
    2.times { fives.pop }
    deck += fives
    hand.cards = deck
    expect(hand.score).to eq((100**7) + (30))
  end

  it 'calculates the value of a straight' do
    arr = [4,5,6,7,8]
    suites = [:h, :h, :c, :d, :s]
    deck = []
    arr.each_index do |index|
      deck << Card.new(arr[index], suites[index])
    end
    hand.cards = deck
    expect(hand.score).to eq((100**5)+30)
  end

  it 'calculates the value of a three of a kind' do
    deck = our_deck.deck.dup.select! { |x| x.value == 10 }
    deck.pop
    deck += [Card.new(3, :s), Card.new(7, :h)]
    hand.cards = deck
    expect(hand.score).to eq((100**4) + 40)
  end

  it 'calculates the value of two pair' do
    deck = [Card.new(2, :s), Card.new(7, :s), Card.new(3, :s),
       Card.new(7, :h),Card.new(3, :d)]
    hand.cards = deck
    expect(hand.score).to eq((100**3) + 22)
  end

  it 'calculates the value of one pair' do
    deck = [Card.new(2, :s), Card.new(7, :s), Card.new(3, :s),
       Card.new(8, :h),Card.new(3, :d)]
    hand.cards = deck
    expect(hand.score).to eq((100**2) + 23)
  end

  it 'calculates the value of high card' do
    deck = [Card.new(2, :s), Card.new(7, :s), Card.new(3, :s),
       Card.new(8, :h),Card.new(6, :d)]
    hand.cards = deck
    expect(hand.score).to eq(100 + [2,7,3,8,6].reduce(:+))
  end
end
