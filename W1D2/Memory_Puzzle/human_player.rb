class HumanPlayer
  attr_reader :player
  def initialize(board)
    @player = "Human"
    @board = board
  end

  def prompt
    puts "Flip a card!"
  end

  def guess
    pos = gets.chomp
    while @board[pos].face_up
      puts "Choose a different card."
      pos = gets.chomp
    end
    @board[pos].reveal
    @previously_guessed_pos = pos
    @board.render
    puts "Guess again"
    pos = gets.chomp
    while @board[pos].face_up || @board[pos] == nil
      puts "Choose a different card."
      pos = gets.chomp
    end
    @board[pos].reveal
    @board.render
    if @board[@previously_guessed_pos] != @board[pos]
      @board[pos].hide
      @board[@previously_guessed_pos].hide
      sleep(3)
    end
    @previously_guessed_pos = nil
  end
end
