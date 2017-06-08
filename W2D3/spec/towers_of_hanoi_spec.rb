require 'rspec'
require 'towers_of_hanoi'

describe 'Towers of Hanoi' do
  let(:tower) {Tower.new}
  it "Checks that we initialize with three stacks" do
    expect(tower.towers).to eq([[3,2,1], [], []])
  end

  it "Moves a disc" do
    tower.move(0,1)
    expect(tower.towers).to eq([[3,2],[1],[]])
  end

  it 'disallows invalid moves' do
    expect { tower.move(1,0) }.to raise_error(":(")
  end

  it 'recognizes invalid disc ordering' do
    tower.move(0,1)
    tower.move(0,2)
    expect { tower.move(2,1) }.to raise_error('disc issue')
  end

  it 'checks that the third or second stack has all 3 disks' do
    tower.towers = [[],[3,2,1], []]
    expect(tower.win?).to be true
  end

end
