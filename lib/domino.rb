module DominoMofo
  
  class Domino
    @ends
    attr_reader :ends
                
    def initialize(end1, end2)
      @ends = Array.new << End.new(end1, self) << End.new(end2, self)
    end
        
    def has_suit? suit
      @ends.any? {|e| e.suit?(suit)}
    end

    def double?
      self.class == Double
    end
    
    def has_both_ends?(end1, end2)
      if  ( @ends[0].suit?(end1) && @ends[1].suit?(end2) ) || 
          ( @ends[1].suit?(end1) && @ends[0].suit?(end2) )
        true
      else
        false
      end
    end
    
    def find_end_of_suit suit
      @ends.find {|e| e.suit?(suit)}
    end
    
    def connect_to_domino_by_suit (domino, suit)
      my_end = self.find_end_of_suit(suit)
      its_end = domino.find_end_of_suit(suit)
      my_end.connect_to(its_end)
    end

    def open?
      @ends.any?{|e| e.open?}
    end

    def connected?
      @ends.any?{|e| e.connected?}
    end

    def find_all_open_ends
      @ends.find_all{|e| e.open?}
    end
  end
end