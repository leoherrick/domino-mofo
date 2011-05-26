
module DominoMofo
  
  class Player
    attr_reader :game, :match, :name
    attr_accessor :hand
    
    def initialize match, name
      @hand = Hand.new
      @match = match
      @name = name
    end
    
    def human_player?
      self.instance_of?(HumanPlayer)
    end
   
   def computer_player?
     self.instance_of?(ComputerPlayer)
   end
      
   def lead_out domino
     Play.new(self, @match.current_game, domino, "domino_played_on", "suit")
     board.lead_out(domino)
   end
   
   def play_domino_on_board_by_suit (domino_in_hand, domino_on_board, suit)
     Play.new(self, @match.current_game, domino_in_hand, domino_on_board, suit)
     board.play_domino_on_board_by_suit(domino_in_hand, domino_on_board, suit)
   end
   
   def draw_from_boneyard
     @hand << @match.current_game.boneyard.draw_one
   end

   def knock
     Play.new(self, @match.current_game, "knocked", "knocked", "knocked")
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