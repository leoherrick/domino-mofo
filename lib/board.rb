module DominoMofo
  
  class Board < DominoGroup     
    attr_reader :dominoes
    
    def initialize 
    end
        
    def place_lead domino
      self << domino
    end
    
    def points
      points = 0
      open_dominoes = self.find_all {|domino| domino.has_open_end?}
      open_sides = open_dominoes.collect {|domino| domino.open_ends}.flatten
      open_sides.each{|side| points += side.suit}
      points
    end
  end
  
end