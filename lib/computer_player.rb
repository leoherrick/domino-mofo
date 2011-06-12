module DominoMofo
  
  class ComputerPlayer < Player  
    
    attr_reader :ai
    
    def initialize (match, name)
      super
      @ai = Ai.new(self)
    end
    
    def update
      if self.match.current_game.board.length > 0 && self.match.current_game.queue.first === self
          make_best_play
      end
    end
        
    def make_best_play
      sleep(0.4)
      if @ai.has_play?
        if @match.current_game.board.empty?
          if @hand.find_highest_double
            lead_out(@hand.find_highest_double)
          else
            lead_out(@hand.first)
          end
        else        
          play_domino_on_board_by_suit(@ai.domino_to_play, @ai.domino_to_play_on, @ai.suit_to_connect)
        end
      elsif @match.current_game.boneyard.empty? 
        knock
      else
        draw_from_boneyard
        make_best_play
      end
    end
  end
end