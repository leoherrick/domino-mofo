module DominoMofo
  
  class Domino
                
    attr_reader :side1, :side2            
                
    def initialize(side1, side2)
      @side1 = {:val => side1}
      @side2 = {:val => side2}
    end
        
    def is_double
      side1 == side2 ? true : false
    end
                    
    def has_suit suit
      get_sides.include?(suit) ? true : false
    end
    
    def has_unconnected_of_suit suit 
      get_unconnected_sides.include?(suit) ? true : false
    end
    
    def return_a_side_matching_suit suit
      if @side1[:val] == suit
        @side1
      elsif @side2[:val] == suit
        @side2
      end
    end
    
    def connect_to_another_by_suit another_domino, suit
      if return_a_side_matching_suit(suit)[:connected_to] == nil
        return_a_side_matching_suit(suit)[:connected_to] = another_domino
        another_domino.connect_to_another_by_suit(self, suit)
      end
    end
    
    def get_unconnected_sides
      result = []
      [@side1, @side2].each{|x| if x[:connected_to] == nil then result << x[:val] end }
      result
    end
        
    private
    
    def get_sides
      [@side1[:val], @side2[:val]]
    end
    
    
  end
end