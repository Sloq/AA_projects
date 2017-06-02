class CompPlayer
  attr_reader :known_card, :matched_cards, :board, :remaining_pos
  def initialize(board)
    @known_card = {}
    @board = board
    @remaining_pos = []
    @matched_cards = []
    (0..3).each do |idx1|
      (0..3).each do |idx2|
        position = [idx1, idx2]
        @remaining_pos << position
      end
    end
  end

  def received_revealed_card(pos, val)
    @known_card[pos] = val
  end

  def receive_match(pos1, pos2)
    @matched_cards << [pos1, pos2]
  end

  def guess
    first_guess = nil
    if @matched_cards.empty?
      random = @remaining_pos.sample
      value = @board[random]
      first_guess += value
      value.face_up
      received_revealed_card(@remaining_pos.sample, value)
      @remaining_pos -= random
    else
      @board[@matched_cards[0][0]].face_up
      @remaining_pos -= @matched_cards[0][0]
      first_guess += @matched_cards[0][0]
    end
  end

end
