module DominoMofo
  
  class Double < Domino
    
    def score
      if self.open?
        self.ends[0].suit + self.ends[1].suit
      end
    end
    
  end
  
end