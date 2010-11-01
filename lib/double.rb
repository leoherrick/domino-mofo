module DominoMofo
  
  class Double < Domino
    
    def initialize(suit)
      @ends = Array.new 
      2.times { @ends << End.new(suit, self) } 
    end
    
    
     def score
      num_of_connected_ends = ends.find_all{|e| e.connected?}.length
      if num_of_connected_ends == 0 || num_of_connected_ends == 1
        suit_of_first_end * 2
      else
        0
      end
    end

    def create_spinner
      domino = Spinner.new(suit_of_first_end)
    end    
  end
  
end