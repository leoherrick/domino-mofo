module DominoMofo
  
  class Board < DominoGroup
    @spinner
    
    attr_reader :spinner
    attr_writer :spinner
        
    def dominoes_in_play
      self.find_all{|domino| domino.open?}
    end    
        
    def ends_in_play
      dominoes_in_play.collect{|domino| result = domino.find_all_open_ends}.flatten
    end
    
    def suits_of_ends_in_play
      ends_in_play.collect{|e| e.suit}
    end
    
    def suits_in_play
      suits_of_ends_in_play.uniq
    end
    
    def score
      collect_scores_of_dominoes_in_play.inject{|sum, x| sum + x}
    end
    
    def collect_scores_of_dominoes_in_play
      dominoes_in_play.collect{|domino| domino.score}
    end
        
  end
end