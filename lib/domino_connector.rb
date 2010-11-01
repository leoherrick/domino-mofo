module DominoMofo
  
  class DominoConnector
    
    def connect_two_dominoes_by_suit(domino1, domino2, suit)
      end1 = domino1.find_open_end_of_suit(suit)
      end2 = domino2.find_open_end_of_suit(suit)
      end1.connect_to(end2)
    end    
  end
end

