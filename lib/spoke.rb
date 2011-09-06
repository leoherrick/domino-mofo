class DominoMofo::Spoke
  include DominoMofo
  attr_reader :chain, :orinetation

  def initialize(spinner, first_domino, orientation)
    @spinner = spinner
    @chain = Array.new
    @orientation = orientation
    add_domino_to_chain(first_domino)
  end

  def add_domino_to_chain( domino )
    last_open_suit = nil
    if @chain.empty? 
      last_open_suit = @spinner.suit_of_end1 
    else 
      last_open_suit = @chain.last[:end_furthest_from_spinner].suit 
    end
    
    end_closest_to_spinner = domino.find_end_of_suit(last_open_suit)
    
    hash = Hash.new
    hash[:domino] = domino
    hash[:end_closest_to_spinner] = end_closest_to_spinner
    hash[:end_furthest_from_spinner] = domino.ends.reject{|x| x == end_closest_to_spinner }.first
  end
end
