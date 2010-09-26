module DominoMofo
  
  class Boneyard

    attr_reader :bones

    def initialize
      @dominos = [
       Domino.new(0,0), Domino.new(0,1), Domino.new(0,2), Domino.new(0,3), Domino.new(0,4), Domino.new(0,5), Domino.new(0,6),
       Domino.new(1,1), Domino.new(1,2), Domino.new(1,3), Domino.new(1,4), Domino.new(1,5), Domino.new(1,6),
       Domino.new(2,2), Domino.new(2,3), Domino.new(2,4), Domino.new(2,5), Domino.new(2,6),
       Domino.new(3,3), Domino.new(3,4), Domino.new(3,5), Domino.new(3,6), 
       Domino.new(4,4), Domino.new(4,5), Domino.new(4,6),
       Domino.new(5,5), Domino.new(5,6),
       Domino.new(6,6)
      ]
    end

    def draw_one_domino
      draw_from_boneyard_at( random_location_in_the_boneyard  ) 
    end
    
    def draw_seven_dominos
      result = Array.new
      7.times { result << draw_from_boneyard_at( random_location_in_the_boneyard ) }
      return result
    end

    def length
      return @dominos.length
    end
    
    def get_all_dominos_of_suit suit
      @dominos.find_all { |domino| domino.has_suit(suit) }
    end
    
    def get_all_doubles
      @dominos.find_all { |domino| domino.is_double }      
    end
    
  private

    def draw_from_boneyard_at location
      @dominos.delete_at( location )
    end

    def random_location_in_the_boneyard 
      rand( self.length )
    end
            
  end
end