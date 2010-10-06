module DominoMofo
  
  class Player
    @hand
    @game
    attr_reader :hand, :game
    
    def initialize game
      @hand = Hand.new
      @game = game
    end
    
    def human_player?
      self.class == HumanPlayer
    end
   
   def computer_player?
     self.class == ComputerPlayer
   end
      
   def lead_with_domino(end1, end2)
     lead_domino = @hand.get_domino_with_ends(end1, end2)
     @game.board.place_lead(lead_domino)
     @hand.remove_domino_with_ends!(end1, end2)
   end
    
  end
end