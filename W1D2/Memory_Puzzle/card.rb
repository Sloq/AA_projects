class Card
  attr_accessor :card
  attr_reader :face_up

  def initialize(card)
    @card = card
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    @card.to_s
  end

  def ==(val)
    @card == val
  end
end
