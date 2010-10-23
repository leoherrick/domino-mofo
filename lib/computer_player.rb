module DominoMofo
  
  class ComputerPlayer < Player  
    
    attr_reader :ai
    
    def initialize ai = easy
      super
      @ai = AiBase.new
    end
  end
end