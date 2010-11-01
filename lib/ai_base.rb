module DominoMofo
  
  class AiBase
        
    def initialize player
      @player = player
    end
        
    def has_play?
      playable_dominoes.length > 0 ? true : false
    end
        
    def domino_to_play
      playable_dominoes.first
    end
    
    def domino_to_play_on
      suit1 = domino_to_play.suit_of_first_end
      suit2 = domino_to_play.suit_of_second_end
      if board.suits_in_play.include?(suit1)
        board.find_domino_with_playable_suit(suit1)
      else 
        board.find_domino_with_playable_suit(suit2)        
      end
    end
    
    def suit_to_connect
      suit1 = domino_to_play.suit_of_first_end
      suit2 = domino_to_play.suit_of_second_end
      return board.suits_in_play.include?(suit1) ? suit1 : suit2
    end
    
    private
    
    def playable_dominoes
      result = DominoGroup.new
      board.suits_in_play.each do |suit|
        result << @player.hand.find_all_dominoes_of_suit(suit)
      end
      return result.flatten.uniq
    end
    
    
    def board
      @player.match.current_game.board
    end    
  end
end