module DominoMofo
  
  class DominoGroup < Array 
        
    def get_all_dominoes_of_suit suit
      self.find_all { |domino| domino.has_suit?(suit) }
    end

    def get_all_doubles
      self.find_all { |domino| domino.double? }      
    end
    
    def get_domino_with_ends(end1, end2)
      result = self.find {|domino| domino.domino_with_ends?(end1,end2)}
      return result
    end
            
    def has_domino_with_ends?(end1, end2)
      result = self.find {|domino| domino.domino_with_ends?(end1,end2)}
      result ? true : false
    end
        
    def remove_domino_with_ends!(end1, end2)
      domino_to_remove = self.find {|domino| domino.domino_with_ends?(end1,end2)}
      self.delete(domino_to_remove)
    end  
  end
  
end