module DominoMofo
  
  class PlayerGroup < Array
            
    def find_player_with_domino(end1, end2)
      self.find{|player| player.hand.has_domino_with_suits?(end1, end2)}
    end
    
    def find_player_with_highest_pair
      suit = 6 # start with six
      player_has_been_found = false
      
      until player_has_been_found
        self.each do |player|
          if player.hand.has_domino_with_suits?(suit, suit) 
            return player
            player_has_been_found = true
          end
        end
        suit = suit - 1
      end
    end
  end
end