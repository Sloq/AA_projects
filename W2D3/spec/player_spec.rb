require 'rspec'
require 'player'


describe "Player" do

  describe '.initialize'
  it "Accepts a name, hand, and pot" do
    expect { Player.new('Harry','hand',4) }.not_to raise_error
  end
  let(:hand) { double("hand") }
  let(:our_hand) {double("hand", cards: ["Ace", "King", "Queen"])}
  let(:our_game) { double('game', global_pot: 500 )}
  let(:player) { Player.new("JJ", our_hand, 10)}

  describe 'place_bet'
  it 'Takes money from personal pot' do
    player.place_bet(4)
    expect(player.pot).to eq(6)
  end

  it 'It alters the cards in your hand' do
    player.discard_card([0,1])
    expect(player.hand.cards).to eq(["Queen"])
  end

  describe 'fold'
  it 'toggles the in_game instance variable' do
    player.fold
    expect(player.in_game).to be false
  end

  describe 'win_hand'
  it 'adds the global pot to personal pot' do
    player.win_hand(our_game.global_pot)
    expect(player.pot).to eq(510)
  end

  describe 'raise'
  it 'asks the player if they would like to raise' do
    player.raise
    expect(STOUT).to include('raise')
  end

  # describe 'see'
  # it 'd'
  #
  # end

end
