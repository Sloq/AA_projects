class Tower
  attr_accessor :towers
  def initialize
    @towers = [[3,2,1], [], []]
  end

  def move(start,destination)
    raise ":(" if @towers[start].empty?
    raise 'disc issue' if (@towers[destination].size > 0) &&
    (@towers[destination][-1] < @towers[start][-1])
    @towers[destination] << @towers[start].pop
  end

  def win?
    @towers[1].size == 3 || @towers[2].size == 3
  end

  def render
    towers.each {|row| puts "#{row}"}
  end

  def get_move
    puts "what tower would you like to take a disk from"
    start_pos = gets.chomp.to_i
    puts "what tower would you like to put your disk on"
    end_pos = gets.chomp.to_i
    move(start_pos, end_pos)
    rescue
      puts "Make Better Move"
      retry
  end

  def play
    until win?
      render
      get_move
    end
    puts "You are a God. Amazing work!!!!!!!!!!!!!!!!!"
  end
end
#
# tower = Tower.new
# tower.play
