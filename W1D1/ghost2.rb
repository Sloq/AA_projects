class Game
  attr_reader :player_one, :player_two, :fragment, :dictionary

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @fragment = ""
    @dictionary = File.readlines('dictionary.txt').map(&:chomp)
    @current_player = player_one
    @previous_player = player_two
    @losses = {player_one => 0, player_two => 0}
  end

  def next_player!
    if @current_player == @player_one
      @current_player = @player_two
      @previous_player = @player_one
    else
      @current_player = @player_one
      @previous_player = @player_two
    end
  end

  def take_turn(player)
    puts "Enter your letter"
    guess = gets.chomp
    if @fragment == ""
      @fragment = @fragment + guess
    else
      until valid_play?(guess)
        puts "Invalid, retry guess"
        guess = gets.chomp
      end
      @fragment = @fragment + guess
    end
  end

  def valid_play?(string)
    temp = @fragment+string
    @dictionary.each do |word|
      if word.length >= temp.length
        return true if word[0...temp.length] == temp
      end
    end
    false
  end

  def lose?
    return true if @dictionary.include?(@fragment)
    false
  end

  def display_standings
    ghost = " Ghost"
    puts "#{@player_one}: #{ghost[0..@losses[@player_one]]}\n#{@player_two}: #{ghost[0..@losses[@player_one]]}"
  end

  def play_round
    until @losses.has_value?(2)
      display_standings
      until lose?
        take_turn(@current_player)
        next_player!
      end
      puts "This round's winner is #{@current_player}"
      @losses[@previous_player] += 1
      @fragment = ""
    end
    puts "The winner of it all is #{@current_player}"

  end

end


hello = Game.new("john","lee")
hello.play_round
