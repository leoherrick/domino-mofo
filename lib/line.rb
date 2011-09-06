class DominoMofo::Line
  include DominoMofo
  attr_reader :chain
  
  def initialize( first_domino )
    @chain = Array.new
    add_domino_to_chain(first_domino)
  end

  def add_domino_to_chain( domino ) 
    last_open_suit = if @chain.empty? then @spinner.suit_of_end1 else @chain.last[:end_furthest_from_spinner].suit end
    end_closest_to_spinner = domino.find_end_of_suit(last_open_suit)
    hash = Hash.new
    hash[:domino] = domino
    hash[:end_closest_to_spinner] = end_closest_to_spinner
    hash[:end_furthest_from_spinner] = domino.ends.reject{|x| x == end_closest_to_spinner }.first
  end
  
end

