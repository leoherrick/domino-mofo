module DominoMofo
  
  class Double < Domino
    
    def scoring_pips
      result = 0
      @ends.each {|e| result += e.suit}
      result
    end
    
  end
  
end