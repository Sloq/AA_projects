class Tile
  attr_accessor :bomb, :flag, :number, :revealed
  def initialize
    @bomb = false
    @flag = false
    @number = 0
    @revealed = false
  end
end

class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(9) {Array.new(9)}
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def north(pos)
    row, col = pos
    [row-1, col]
  end

  def south(pos)
    row, col = pos
    [row+1, col]
  end

  def east(pos)
    row, col = pos
    [row, col+1]
  end

  def west(pos)
    row, col = pos
    [row, col-1]
  end

  def north_east(pos)
    row, col = pos
    [row-1, col+1]
  end

  def north_west(pos)
    row, col = pos
    [row-1, col-1]
  end

  def south_east(pos)
    row, col = pos
    [row+1, col+1]
  end

  def south_west(pos)
    row, col = pos
    [row+1, col-1]
  end

  def all_around(pos)
    [south(pos), east(pos), west(pos), north(pos), north_east(pos),
    north_west(pos), south_west(pos), south_east(pos)]
  end

  def no_bombs_around?(pos)
    x = all_around(pos).select {|position| self[position].revealed == false}
    return false if x.empty?
    x.none? {|position| self[position].bomb == true }
  end

  def open_positions(pos)
    if !no_bombs_around(pos)
      self[pos].number = all_around(pos).count {|space| self[space].bomb == true}
      self[pos].revealed = true
      return true
    end
    self[pos].revealed = true
    all_around(pos).each do |tile_pos|
      x = open_positions(tile_pos)
      return true if x
    end
  end

  def render
    display = nil
    @grid.each_with_index do |row,row_index|
      display = ""
      row.each_index do |col_index|
        current_tile = self[[row_index,col_index]]
        if current_tile.revealed
          display += " #{current_tile.number}  "
        else
          display += " # "
        end
      end
      puts display
    end
  end


end
