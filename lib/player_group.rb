module DominoMofo
  
  class PlayerGroup < Array
        
    def human_player
      self.find{|player| player.human_player?}
    end
    
    def find_player_with_domino(end1, end2)
      self.find{|player| player.hand.has_domino_with_both_ends?(end1, end2)}
    end
        
    
  end
end