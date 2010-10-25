module DominoMofo
  
  class AiBase
    
    @player
        
    def initialize player
      @player = player
    end
    
    def playable_dominoes
      result = Array.new
      board.suits_in_play.each do |suit|
        result << @player.hand.get_all_dominoes_of_suit(suit)
      end
      return result.flatten.uniq
    end
    
    def has_play?
      playable_dominoes.length > 0 ? true : false
    end
    
    def domino_to_play
      playable_dominoes.first
    end

    def domino_to_play_on
      suit1 = domino_to_play.ends[0].suit
      suit2 = domino_to_play.ends[1].suit
      if board.suits_in_play.include?(suit1)
        board.find_domino_with_playable_suit(suit1)
      else 
        board.find_domino_with_playable_suit(suit2)        
      end
    end
    
    def board
      @player.match.active_game.board
    end    
  end
end