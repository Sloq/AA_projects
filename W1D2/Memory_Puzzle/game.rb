require './card'
require './board'
require './human_player'
require './comp_player'

class Game
  attr_reader :previously_guessed_pos, :board
  def initialize
    @board = Board.new
    @previously_guessed_pos = nil


  end

  def play
    until @board.won?
      @board.render
      puts "Flip a card!"
      make_guess
    end
    puts "Win."
  end

  def make_guess
    guess
  end

end

fun = Game.new
p fun.board
fun.play
