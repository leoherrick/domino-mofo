module DominoMofo
  
  class Line        
    @dominoes
    attr_reader :dominoes
    
    def initialize 
      @dominoes = DominoGroup.new
    end
    
    def place_lead domino
      @dominoes << domino
    end
  end
  
end