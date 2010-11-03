module DominoMofo
  
  class Board < DominoGroup
    
    def dominoes_in_play
      domino_group = DominoGroup.new
      find_all{|domino| domino.open?}.each do |open_domino|
        domino_group << open_domino
      end
      domino_group
    end
            
    def suits_in_play
      if empty?
        (0..6)
      else
        ends_in_play.collect{|e| e.suit}.uniq
      end
    end

    def total_score
      domino_scores = dominoes_in_play.collect{|domino| domino.score}
      domino_scores.inject{|sum, x| sum + x}
    end
    
    def lead_out domino
      domino = promote_to_spinner_if_need_be(domino)
      add_to_board(domino)
    end
    
    def play_domino_on_board_by_suit (new_dom, dom_on_board, suit)
      new_dom = promote_to_spinner_if_need_be(new_dom)
      add_to_board(new_dom)
      new_dom.connect_to_another_domino_by_suit(dom_on_board, suit)
    end
    
    def playable_domino_of_suit suit
      ends_in_play.find{|e| e.suit == suit}.domino
    end    
   
    private    
    
    def ends_in_play
      result = Array.new
      dominoes_in_play.each do |dom|
        dom.find_all_open_ends.each do |e|
          result << e
        end
      end
      result
    end
    
    def promote_to_spinner_if_need_be domino
      if @spinner == nil && domino.double?
        @spinner = Spinner.new(domino.suit_of_end1)
      else
        domino
      end     
    end
      
    def add_to_board domino
      domino = promote_to_spinner_if_need_be(domino)
      self << domino
    end
    
  end
end