module DominoMofo
  
  class Domino
                
    attr_reader :side1, :side2            
                
    def initialize(side1, side2)
      @side1 = {:val => side1}
      @side2 = {:val => side2}
    end
                    
    def is_of_suit( suit )
      if suit == "doubles" && side1 == side2
        return true
      elsif get_sides.include?(suit)
        return true
      else 
        return false
      end
    end
    
    def return_a_side_matching number
      if @side1[:val] == number
        @side1
      elsif @side2[:val] == number
        @side2
      end
    end
    
    def connect(another_domino, suit)
      if return_a_side_matching(suit)[:connected_to] == nil
        return_a_side_matching(suit)[:connected_to] = another_domino
        another_domino.connect(self, suit)
      end
    end
    
    def unconnected_sides
      result = []
      [@side1, @side2].each{|x| if x[:connected_to] == nil then result << x[:val] end }
      result
    end
    
    def has_unmatched_of? suit
      unconnected_sides.include?(suit) ? true : false
    end
    
    private
    
    def get_sides
      [@side1[:val], @side2[:val]]
    end
    
    
  end
end