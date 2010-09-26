module DominoMofo
  
  class Line
    
    attr_reader :dominos, :spinner
    attr_writer :dominos

    def initialize opening_domino
      @dominos = [opening_domino]
      if opening_domino.is_of_suit("doubles")
        @spinner = opening_domino
      else 
        @spinner = nil
      end
    end
    
    def return_unmatched_of suit
      @dominos.find{|bone| bone.has_unmatched_of?(suit) }
    end
        
    def add_domino(domino, suit)      
      @dominos << domino
      if domino.is_of_suit("doubles") && @spinner == nil
        @spinner = domino
      end
      board_domino = return_unmatched_of(suit)
      domino.connect(board_domino, suit)
      return self
    end
    
    def number_of_suit suit
      @dominos.find_all{|x| x.is_of_suit(suit)}.length
    end
    
    def unconnected_sides
      result = Array.new
      @dominos.each{|x| result = x.unconnected_sides + result}
      result
    end
        
  end
end