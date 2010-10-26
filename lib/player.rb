module DominoMofo
  
  class Player
    @hand
    @match
    attr_reader :hand, :game, :match
    
    def initialize match
      @hand = Hand.new
      @match = match
    end
    
    def human_player?
      self.instance_of?(HumanPlayer)
    end
   
   def computer_player?
     self.instance_of?(ComputerPlayer)
   end
      
   def lead_out domino
     remove_from_hand(domino)
     bc.lead_out(domino)
     advance_turn
   end
   
   def play_domino_on_board_by_suit (domino_in_hand, domino_on_board, suit)
     remove_from_hand(domino_in_hand)
     bc.play_domino_on_board_by_suit(domino_in_hand, domino_on_board, suit)
     advance_turn
   end
   
   def draw_from_boneyard
     @hand << @match.active_game.boneyard.draw_one
   end

   def knock
     advance_turn
   end
      
   #private
   
   def bc #board_controller
     @match.active_game.board_controller
   end
   
   def remove_from_hand domino
     @hand.delete(domino)
   end
   
   def advance_turn
     @match.active_game.queue.shift_queue!
   end
  end
end