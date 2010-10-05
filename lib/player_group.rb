module DominoMofo
  
  class PlayerGroup < Array
        
    def human_player
      self.find{|player| player.is_human?}
    end
    
    def find_player_with_domino(side1, side2)
      self.find{|player| player.hand.has_domino?(side1, side2)}
    end
        
    
  end
end