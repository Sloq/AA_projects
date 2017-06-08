require 'rspec'
require 'card'

describe 'card class' do
  let(:our_card) {Card.new(1, :c)}
  it "checks that the card value initializes with a number value" do
    expect(our_card.value).to eq(1)
  end

  it "checks that the card suite initializes with a symbol" do
    expect([:c, :h, :d, :s]).to include(our_card.suite)
  end

end
