module DominoMofo
  
  class Board < DominoGroup
    
    attr_accessor :spinner
    attr_reader :controller
    
    def initialize
      @controller = BoardController.new(self)
    end
        
    def suits_in_play
      if empty?
        [0,1,2,3,4,5,6]
      else
      suits_of_ends_in_play.uniq
      end
    end
    
    def score
      collect_scores_of_dominoes_in_play.inject{|sum, x| sum + x}
    end
    
    def find_domino_with_playable_suit suit
      ends_in_play.find{|e| e.suit == suit}.domino
    end

#private    

    def suits_of_ends_in_play
      ends_in_play.collect{|e| e.suit}
    end

    def ends_in_play
      result = Array.new
      dominoes_in_play.each do |dom|
        dom.find_all_open_ends.each do |e|
          result << e
        end
      end
      return result
    end
      
    def dominoes_in_play
      self.find_all{|domino| domino.open?}
    end
    
    def collect_scores_of_dominoes_in_play
      dominoes_in_play.collect{|domino| domino.score}
    end     
  end
end