class DominoMofo::Board < DominoMofo::DominoGroup
  include DominoMofo
  attr_reader :spinner
  
  def initialize()
    @spinner = nil
    @spokes = Array.new
    @line = nil
  end
              
  def update ( play )
    if play.is_a?(LeadOut) 
      lead_out(play.domino)
    elsif play.is_a?(Knock)
      # do nothing
    elsif play.is_a?(Play)
      play_domino_on_board(play.domino, play.domino_played_on)
    end
  end
      
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
    if dominoes_in_play.length > 0
      domino_scores = dominoes_in_play.collect{|domino| domino.score}
      domino_scores.inject{|sum, x| sum + x}
    else 
      0
    end
  end
  
  def lead_out domino
    add_to_board(domino)
    unless domino.double?
      
    end
  end
  
  def play_domino_on_board (new_dom, dom_on_board)
    add_to_board(new_dom)
    new_dom.connect_to_another_domino(dom_on_board)
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
  
  def change_line_to_spoke line
  end
  
  def add_to_spoke domino
  end
  
  def add_to_line domino
  end
  
end
