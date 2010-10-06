module DominoMofo
  
  class ComputerPlayer < Player  
    @ai
    attr_reader :ai
    
    def initialize ai = easy
      super
      @ai = AIEasy.new(@game.board, @hand)
    end
    
    def play
      @ai.play_best_domino
    end
    
  end
    
end