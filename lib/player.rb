module DominoMofo
  
  class Player
    
    attr_reader :hand, :human_player
    attr_writer :hand
    
    def initialize
      @hand = Hand.new
    end
    
    def is_human?
      self.class == HumanPlayer
    end
   
   def is_computer_player?
     self.class == ComputerPlayer
   end
    
  end
end