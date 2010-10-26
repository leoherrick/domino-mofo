module DominoMofo
  
  class BoardController
    
    @board
    DC = DominoConnector.new
    
    def initialize board
      @board = board
    end
    
    def lead_out domino
      domino = promote_to_spinner_if_need_be(domino)
      add_to_board(domino)
    end
    
    def play_domino_on_board_by_suit (new_dom, dom_on_board, suit)
      new_dom = promote_to_spinner_if_need_be(new_dom)
      add_to_board(new_dom)
      DC.connect_two_dominoes_by_suit(new_dom, dom_on_board, suit)
    end

    def add_to_board domino
      @board << domino
    end
  
    def promote_to_spinner_if_need_be domino
      if domino_would_be_spinner?(domino)
        return promote_to_spinner(domino)
      else
        return domino
      end
      
    end
  
    def domino_would_be_spinner? domino
      !@board.spinner && domino.double?
    end
    
    def promote_to_spinner domino
      domino = domino.create_spinner
      @board.spinner = domino
      return domino
    end  
  end
end
