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
      
   def lead_with_domino(end1, end2)
     lead_domino = @hand.get_domino_with_ends(end1, end2)
     @match.active_game.board.place_lead(lead_domino)
     @hand.remove_domino_with_ends!(end1, end2)
   end
    
  end
end