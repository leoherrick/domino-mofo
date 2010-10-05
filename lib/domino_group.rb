module DominoMofo
  
  class DominoGroup < Array 
        
    def get_all_dominoes_of_suit suit
      self.find_all { |domino| domino.has_suit?(suit) }
    end

    def get_all_doubles
      self.find_all { |domino| domino.is_double? }      
    end
    
    def get_domino(side1, side2)
      result = self.find {|domino| domino.is_domino?(side1,side2)}
      return result
    end
            
    def has_domino?(side1, side2)
      result = self.find {|domino| domino.is_domino?(side1,side2)}
      result ? true : false
    end
        
    def remove_domino!(side1, side2)
      domino_to_remove = self.find {|domino| domino.is_domino?(side1,side2)}
      self.delete(domino_to_remove)
    end  
  end
  
end