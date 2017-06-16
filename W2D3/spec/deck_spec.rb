require 'rspec'
require 'deck'

describe "Deck" do
  let(:our_deck) {Deck.new}
  it "Should initialize with 52 cards" do
    expect(our_deck.deck.size).to eq(52)
  end

  it "Should shuffle the deck" do
    deck_dup = our_deck.deck.dup
    expect(our_deck.shuffle).not_to eq(deck_dup)
  end

  it "Keep track of cards dealt" do
    our_deck.deal(5)
    expect(our_deck.deck.size).to eq(52 -5)
  end

  it "Receives cards back from table" do
    our_deck.deal(5)
    our_deck.collect
    expect(our_deck.deck.size).to eq(52)
  end

end
