require './tile'
require 'colorize'

class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def self.from_file(file_name)
    rows = File.readlines(file_name).map(&:chomp)
    rows
    my_grid = Array.new(9) {Array.new(9)}
    (0..8).each do |idx|
      (0..8).each do |idx2|
        my_grid[idx][idx2] = Tile.new(rows[idx][idx2])
      end
    end
    puts my_board = Board.new(my_grid)
  end

  #A method to update the value of a Tile at the given position
  def update_tile(position)

  end

  #method to display the current board state
  def render

  end

  #let us know if the game is over
  def solved?

  end
end

Board.from_file('sudoku1.txt')
