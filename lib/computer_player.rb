module DominoMofo
  
  class ComputerPlayer < Player  
    
    attr_reader :ai
    
    def initialize(match)
      super
      @ai = AiBase.new(self)
    end
  end
end