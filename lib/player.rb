
module DominoMofo
  
  class Player
    include Observable
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
     changed
     notify_observers
   end
   
   def play_domino_on_board_by_suit (domino_in_hand, domino_on_board, suit)
     remove_from_hand(domino_in_hand)
     board.play_domino_on_board_by_suit(domino_in_hand, domino_on_board, suit)
     changed
     notify_observers
   end
   
   def draw_from_boneyard
     @hand << @match.current_game.boneyard.draw_one
   end

   def knock
     changed
     notify_observers
   end
      
   #private
   
   def board #board_controller
     @match.current_game.board
   end
   
   def remove_from_hand domino
     @hand.delete(domino)
   end
   
  end
end