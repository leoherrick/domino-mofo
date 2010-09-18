module Radbones
  
  class Domino
    
    attr_reader :sides
    
    def initialize(side_one, side_two)
      @sides = [side_one, side_two]
    end
    
    def is_of_suit?( suit )
      if suit == "doubles" && @sides[0] == @sides[1]
        return true
      elsif @sides.include?(suit)
        return true
      else 
        return false
      end
    end
  end
end