class DominoMofo::Domino
  include DominoMofo

  attr_reader :ends
  attr_accessor :spinward_side, :endward_side
              
  def initialize(end1, end2)
    @ends = Array.new 
    @ends << End.new(end1, self)
    @ends << End.new(end2, self)
  end
      
  def has_suit? suit
    @ends.any? {|e| e.suit?(suit)}
  end

  def double?
    self.kind_of?(Double)
  end
  
  def rounded_value
    total = suit_of_end1 + suit_of_end2
    remain = total % 5
    thresh = 2.5
    if  remain > thresh
      diff = 5 - remain
      total + diff
    else
      total - remain
    end
  end
  
  def has_both_suits?(suit1, suit2)
    if  ( @ends[0].suit?(suit1) && @ends[1].suit?(suit2) ) || 
        ( @ends[1].suit?(suit1) && @ends[0].suit?(suit2) )
      true
    else
      false
    end
  end
      
  def open?
    @ends.any?{|e| e.open?}
  end

  def connected?
    @ends.any?{|e| e.connected?}
  end

  def find_end_of_suit suit
   @ends.find {|e| e.suit?(suit)}
  end

  def find_all_open_ends
    @ends.find_all{|e| e.open?}
  end

  def score
    if open?
      find_all_open_ends.collect{|e| e.suit}.inject{|sum, x| sum + x}
    else
      0
    end
  end

  def connect_to_another_domino(other_domino)
    open_end_of_other_domino = other_domino.find_all_open_ends.find {|open_end| open_end.suit == suit_of_end1 || open_end.suit == suit_of_end2 }
    end_on_self_to_connect = find_end_of_suit( open_end_of_other_domino.suit )
    end_on_self_to_connect.connect_to(open_end_of_other_domino)
  end

  def find_open_end_of_suit suit
    @ends.find {|e| e.suit?(suit) && e.open?}
  end

  def suit_of_end1
    @ends[0].suit
  end

  def suit_of_end2
    @ends[1].suit
  end
end
