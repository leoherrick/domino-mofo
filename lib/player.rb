module DominoMofo
  
  class Player
    @hand
    @game
    attr_reader :hand, :game
    
    def initialize
      @hand = Hand.new
    end
    
    def is_human?
      self.class == HumanPlayer
    end
   
   def is_computer_player?
     self.class == ComputerPlayer
   end
   
   def join_game game
     @game = game
   end
   
   def lead_with_domino(side1, side2)
     boxcars = @hand.get_domino(side1, side2)
     @game.line.place_lead(boxcars)
     @hand.remove_domino!(side1, side2)
   end
    
  end
end