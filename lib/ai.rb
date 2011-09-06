class DominoMofo::Ai
  include DominoMofo
      
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
    suit1 = domino_to_play.suit_of_end1
    suit2 = domino_to_play.suit_of_end2
    if board.suits_in_play.include?(suit1)
      board.playable_domino_of_suit(suit1)
    else 
      board.playable_domino_of_suit(suit2)        
    end
  end
  
  def suit_to_connect
    dom1suit1 = domino_to_play.suit_of_end1
    dom1suit2 = domino_to_play.suit_of_end2
    dom2suit1 = domino_to_play_on.suit_of_end1
    dom2suit2 = domino_to_play_on.suit_of_end2
    if dom1suit1 == dom2suit1
      dom1suit1
    elsif dom1suit1 == dom2suit2
      dom1suit1
    elsif dom1suit2 == dom2suit1
      dom2suit1
    elsif dom1suit2 == dom2suit2
      dom2suit2
    else
      nil
    end
  end
  
  private
  
  def playable_dominoes
    result = DominoGroup.new
    board.suits_in_play.each do |suit|
      hand.find_all_dominoes_of_suit(suit).each do |domino|
        result << domino
      end
    end
    result.uniq
  end
      
  def hand
    @player.hand
  end
  
  def board
    @player.match.current_game.board
  end    
end
