module Radbones
  class Boneyard
    attr_reader :bones

    def initialize
      @bones = [
       Domino.new(0,0), Domino.new(0,1), Domino.new(0,2), Domino.new(0,3), Domino.new(0,4), Domino.new(0,5), Domino.new(0,6),
       Domino.new(1,1), Domino.new(1,2), Domino.new(1,3), Domino.new(1,4), Domino.new(1,5), Domino.new(1,6),
       Domino.new(2,2), Domino.new(2,3), Domino.new(2,4), Domino.new(2,5), Domino.new(2,6),
       Domino.new(3,3), Domino.new(3,4), Domino.new(3,5), Domino.new(3,6), 
       Domino.new(4,4), Domino.new(4,5), Domino.new(4,6),
       Domino.new(5,5), Domino.new(5,6),
       Domino.new(6,6)
      ]
    end

    def draw *number
      n = number.first || 1
      result = []
      n.times do 
        unless @bones.empty?
          result << @bones.delete_at(rand( @bones.length )  )
        else 
          raise "not enough dominos"
        end
      end
      return result
    end
    
    def length
      return @bones.length
    end
    
  end
end