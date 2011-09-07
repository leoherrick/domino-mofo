class DominoMofo::End
  include DominoMofo
  attr_reader :suit, :connected_to, :domino
  attr_writer :connected_to
  
  def initialize (suit, domino)
    @suit = suit
    @domino = domino
  end
      
  def suit? suit
    suit == @suit
  end
  
  def connected?
    @connected_to ? true : false
  end

  def open?
    !connected?
  end

  def connect_to another_end
    if another_end.is_a?(End) && another_end.suit == suit
      self.connected_to = another_end
      another_end.connected_to = self
    end
  end
        
end