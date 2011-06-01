
module DominoMofo
  
  class Player
    attr_reader :match, :name
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
     LeadOut.new(self, @match.current_game, domino, "domino_played_on", "suit")
   end
   
   def play_domino_on_board_by_suit (domino_in_hand, domino_on_board, suit)
     if hand.length == 1 
       WinningPlay.new(self, @match.current_game, domino_in_hand, domino_on_board, suit)
     else
       Play.new(self, @match.current_game, domino_in_hand, domino_on_board, suit)
     end
   end
   
   def draw_from_boneyard
     Draw.new(self, @match.current_game, "draw", "draw", "draw")
   end

   def knock
     Knock.new(self, @match.current_game, "knocked", "knocked", "knocked")
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