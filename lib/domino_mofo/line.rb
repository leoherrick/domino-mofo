module DominoMofo
  
  class Line
    
    attr_reader :dominos, :spinner
    attr_writer :dominos

    def initialize opening_domino
      @dominos = [opening_domino]
      if opening_domino.has_suit("doubles")
        @spinner = opening_domino
      else 
        @spinner = nil
      end
    end
    
    def return_unmatched_of suit
      @dominos.find{|bone| bone.has_unconnected_of_suit(suit) }
    end
        
    def add_domino(domino, suit)      
      @dominos << domino
      if domino.is_double && @spinner == nil
        @spinner = domino
      end
      board_domino = return_unmatched_of(suit)
      domino.connect_to_another_by_suit(board_domino, suit)
      return self
    end
    
    def number_of_suit suit
      @dominos.find_all{|x| x.has_suit(suit)}.length
    end
    
    def get_unconnected_sides
      result = Array.new
      @dominos.each{|x| result = x.get_unconnected_sides + result}
      result
    end
        
  end
end