require './card'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(4) {Array.new(4)}
    populate
  end

  def [](pos)
    row, column = pos[0].to_i, pos[-1].to_i
    @grid[row][column]
  end

  def []=(pos, val)
    row, column = pos
    @grid[row][column] = val
  end

  def populate
    # pairs = (0...@grid.count**2/2).map {|int| int.to_s + "a"} + (0...@grid.count**2/2).map {|int| int.to_s + "b"}
    # pairs = pairs.shuffle
    pairs = ((1..8).to_a*2).shuffle
    (0...@grid.count).each do |row_idx|
      (0...@grid.count).each do |col_idx|
        @grid[row_idx][col_idx] = Card.new(pairs.pop)
      end
    end
  end

  def render
    system("clear")
    @grid.each do |row|
      row_str = ""
      row.each do |single_card|
        if single_card.face_up
          row_str += single_card.to_s
        else
          row_str += "X"
        end
      end
      puts row_str
    end
  end

  def won?
    all_cards = @grid.flatten
    all_cards.all? {|card| card.face_up }
  end

  def reveal(guessed_pos)
    @grid[pos].face_up = true
    @grid[pos]
  end

end
