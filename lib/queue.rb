module DominoMofo
  
  class Queue < Array
    
    def player_at_turn
      first
    end
    
    def shift_queue!
      push self.shift
    end
    
    def shift_to_player! player
      until self[0] === player
        self.shift_queue!
      end
    end
    
  end
  
end