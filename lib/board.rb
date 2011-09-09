class DominoMofo::Board < DominoMofo::DominoGroup
  include DominoMofo
  
  def update ( play )
    if play.is_a?( LeadOut ) 
      lead_out(play.domino)
    elsif play.is_a?( Knock )
      # do nothing
    elsif play.is_a?( Play )
      play_domino_on_board( play.domino, play.domino_played_on )
    end
  end
      
  def spokes 
    spokes = []
    if spinner
      spinner.neighbors.each do |n|
        line = Hash.new
        line[n.distance_from_spinner] = n
        build_line(n, line)
        spokes << line
      end
    end
    spokes
  end
      
  def dominoes_in_play
    domino_group = DominoGroup.new
    find_all{ |domino| domino.open? }.each do |open_domino|
      domino_group << open_domino
    end
    domino_group
  end

  def spinner
    find{ |x| x.is_a?( Spinner ) }
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
    if would_be_spinner? domino
      domino = Spinner.new(domino.suit_of_end1)
      @spinner = domino
      orient!
    end
    self << domino
  end
  
  def play_domino_on_board ( new_dom, dom_on_board )
    if would_be_spinner? new_dom
      new_dom = Spinner.new(domino.suit_of_end1)
      @spinner = new_dom
      orient!
    end
    new_dom.connect_to(dom_on_board)
    new_dom.orient_to_spinner
    self << new_dom
  end
  
  def playable_domino_of_suit suit
    ends_in_play.find{|e| e.suit == suit}.domino
  end    
 
  private    
  
  def build_line(domino, line)
    dist_from_spin = domino.distance_from_spinner
    line[dist_from_spin] = domino
    next_domino = domino.neighbors.find{ |n| n.distance_from_spinner == dist_from_spin + 1 }
    if next_domino 
      build_line(next_domino, line) 
    end 
  end
  
  def ends_in_play
    result = Array.new
    dominoes_in_play.each do |dom|
      dom.find_all_open_ends.each do |e|
        result << e
      end
    end
    result
  end
  
  def would_be_spinner? domino
    @spinner == nil && domino.double?
  end
  
  def orient!
    @spinner.orient_to_spinner
  end
  
end
