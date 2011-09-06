class DominoMofo::Player
  include DominoMofo
  attr_reader :match, :name
  attr_accessor :hand, :score
  
  def initialize match, name
    @hand = Hand.new
    @match = match
    @name = name
    @score = 0
  end
  
  def human_player?
    self.instance_of?(HumanPlayer)
  end
 
 def computer_player?
   self.instance_of?(ComputerPlayer)
 end
    
 def lead_out domino
   LeadOut.new(self, @match.current_game, domino, "domino_played_on")
 end
 
 def play_domino_on_board (domino_in_hand, domino_on_board)
   if domino_on_board.has_suit?(domino_in_hand.suit_of_end1) || domino_on_board.has_suit?(domino_in_hand.suit_of_end2)
     if hand.length == 1 
       WinningPlay.new(self, @match.current_game, domino_in_hand, domino_on_board)
     else
       Play.new(self, @match.current_game, domino_in_hand, domino_on_board)
     end
   else 
     raise "you cannot play this domino"
   end
 end
 
 def draw_from_boneyard
   Draw.new(self, @match.current_game, "draw", "draw")
 end

 def knock
   Knock.new(self, @match.current_game, "knocked", "knocked")
 end
    
 #private
 
 def board #board_controller
   @match.current_game.board
 end
 
 def remove_from_hand domino
   @hand.delete(domino)
 end
 
end