require 'rspec'
require 'tdd_functions'

describe 'tdd_functions' do
  context '.my_uniq'
  it 'removes duplicates from an array' do
    expect([1,1,1,2,3,4,4,5].my_uniq).to eq([1,2,3,4,5])
  end
  it 'returns an empty array when called on an empty array' do
    expect([].my_uniq).to eq([])
  end

  context '.two_sum'
  it 'returns array of index pairs adding to zero' do
    expect([-1,0,1].two_sum).to eq([[0,2]])
  end
  it 'returns empty array if none of the elements add to zero' do
    expect([1,2,3,4,5,6,7,8].two_sum).to eq([])
  end

  context '.my_transpose'
  it 'transposes a nested array' do
    expect([[0,1,2],[3,4,5],[6,7,8]].my_transpose).to eq([[0,3,6],[1,4,7],[2,5,8]])
  end

  context 'stock picker'
  it 'chooses the lowest day to buy a stock and the best day to sell that respective stock' do
    expect([1,2,3,4,5,6,7].stock_picker).to eq ([0,6])
  end
end
