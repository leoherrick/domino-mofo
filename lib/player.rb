module DominoMofo
  
  class Player
    attr_reader :game, :match
    attr_accessor :hand
    
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
     board.lead_out(domino)
     advance_turn
   end
   
   def play_domino_on_board_by_suit (domino_in_hand, domino_on_board, suit)
     remove_from_hand(domino_in_hand)
     board.play_domino_on_board_by_suit(domino_in_hand, domino_on_board, suit)
     advance_turn
   end
   
   def draw_from_boneyard
     @hand << @match.current_game.boneyard.draw_one
   end

   def knock
     advance_turn
   end
      
   #private
   
   def board #board_controller
     @match.current_game.board
   end
   
   def remove_from_hand domino
     @hand.delete(domino)
   end
   
   def advance_turn
     @match.current_game.queue.shift_queue!
   end
  end
end