module DominoMofo
  
  class Domino
                
    attr_reader :side1, :side2            
                
    def initialize(side1, side2)
      @side1 = {:val => side1}
      @side2 = {:val => side2}
    end
        
    def double?
      @side1 == @side2 ? true : false
    end
                    
    def has_suit? suit
      get_sides.include?(suit) ? true : false
    end
    
    def domino_with_sides?(side1, side2)
      if side1 == @side1[:val] && side2 == @side2[:val]
        true
      elsif side1 == @side2[:val] && side2 == @side1[:val]
        true
      else
        false
      end
    end

    private
    
    def get_sides
      [@side1[:val], @side2[:val]]
    end
    
    
  end
end