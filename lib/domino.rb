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
      self.kind_of?(Double)
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
    
    def open?
      @ends.any?{|e| e.open?}
    end

    def connected?
      @ends.any?{|e| e.connected?}
    end

    def find_all_open_ends
      @ends.find_all{|e| e.open?}
    end
    
    def find_open_end_of_suit suit
      @ends.find {|e| e.suit?(suit) && e.open?}
    end
    
    def score
      find_all_open_ends.collect{|e| e.suit}.inject{|sum, x| sum + x}
    end
    
  end
end