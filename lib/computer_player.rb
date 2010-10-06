module DominoMofo
  
  class ComputerPlayer < Player  
    @ai
    attr_reader :ai
    
    def initialize ai = easy
      super
      @ai = AIEasy.new
    end
    
    def play
      @ai.play_best_domino(@game.board, @hand)
    end
    
  end
    
end