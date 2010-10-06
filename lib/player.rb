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
      
   def lead_with_domino(side1, side2)
     lead_domino = @hand.get_domino_with_sides(side1, side2)
     @game.board.place_lead(lead_domino)
     @hand.remove_domino_with_sides!(side1, side2)
   end
    
  end
end