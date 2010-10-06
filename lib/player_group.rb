module DominoMofo
  
  class PlayerGroup < Array
        
    def human_player
      self.find{|player| player.human_player?}
    end
    
    def find_player_with_domino(side1, side2)
      self.find{|player| player.hand.has_domino_with_sides?(side1, side2)}
    end
        
    
  end
end