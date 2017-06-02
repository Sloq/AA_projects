class Game
  attr_accessor :players, :fragment, :dictionary

  def initialize(players)
    @players = players
    @fragment = ""
    @dictionary = File.readlines('dictionary.txt').map(&:chomp)
    @current_player = players[0]
    @previous_player = ""
    @losses = {}
    players.each do |player|
      @losses[player] = 0
    end
  end

  def next_player!
    @previous_player = @current_player
    @current_player = @players[(@players.find_index(@current_player)+1)% (@players.length)]
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
    @losses.keys.each do |player|
      puts "#{player}: #{ghost[0..@losses[player]]}"
    end
  end

  def play_round
    until @losses.length == 1
      display_standings
      until lose?
        take_turn(@current_player)
        next_player!
      end
      puts "This round's winner is #{@current_player}"
      @losses[@previous_player] += 1
      @fragment = ""

      @losses.delete_if{|k,v| v==2}

    end
    puts "The winner of it all is #{@current_player}"

  end

end


hello = Game.new(["john","lee","steph"])
hello.play_round
