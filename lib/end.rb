module DominoMofo
  
  class End
    @suit
    @connected_to
    attr_reader :suit, :connected_to
    attr_writer :connected_to
    
    def initialize suit
      @suit = suit
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
      unless connected? || another_end.connected?
      unless suit != another_end.suit
        self.connected_to = another_end
        another_end.connected_to = self
      end
    end
    end
        
  end
  
end