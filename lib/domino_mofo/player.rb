module DominoMofo
  
  class Player
    
    attr_reader :hand, :number
    attr_writer :hand
    
    def initialize number
      @hand = []
      @number = number
    end
    
    def discard domino
      @hand.each do |domino|
        if domino === domino
          hand.delete(domino)
        end
      end
    end
  end
end