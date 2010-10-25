module DominoMofo
  
  class Double < Domino
    
     def score
      num_of_connected_ends = self.ends.find_all{|e| e.connected?}.length
      if num_of_connected_ends == 0 || num_of_connected_ends == 1
        self.ends[0].suit * 2
      else
        0
      end
    end

    def create_spinner
      suit = self.ends[0].suit
      domino = Spinner.new(suit, suit)
    end    
  end
  
end