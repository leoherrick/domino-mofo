module DominoMofo
  
  class TurnQueue < PlayerGroup
    
    def shift_queue!
      push self.shift
    end
    
    def shift_to_player! player
      index(player).times do
        shift_queue!
      end
    end
  end
end