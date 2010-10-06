module DominoMofo
  
  class Domino
    @ends
    @end1
    @end2
    attr_reader :ends
                
    def initialize(end1, end2)
      @ends = Array.new << End.new(end1) << End.new(end2)
      @end1 = @ends[0]
      @end2 = @ends[1]
    end
        
    def double?
      @end1.suit == @end2.suit ? true : false
    end
                    
    def has_suit? suit
      get_ends.include?(suit) ? true : false
    end
    
    def domino_with_ends?(end1, end2)
      if  @end1.suit?(end1) && @end2.suit?(end2)
        true
      elsif @end2.suit?(end1) && @end1.suit?(end2)
        true
      else
        false
      end
    end

    def has_open_end?
      @end1.open? or @end2.open? ? true : false
    end
    
    def open_ends
      @ends.find_all{|e| e.open?}
    end

    private
    
    def get_ends
      [@end1.suit, @end2.suit]
    end

  end
end