class DominoMofo::DominoGroup < Array 
  include DominoMofo
  
  def has_domino_with_suits?(suit1, suit2)
    result = self.find {|domino| domino.has_both_suits?(suit1, suit2)}
    result ? true : false
  end
  
  def find_all_dominoes_of_suit suit
    domino_group = DominoGroup.new
    find_all { |domino| domino.has_suit?(suit) }.each do |domino|
      domino_group << domino
    end
    domino_group
  end

  def find_all_doubles
    domino_group = DominoGroup.new
    find_all { |domino| domino.double? }.each do |domino|
      domino_group << domino
    end
    domino_group
  end
  
  def find_domino_with_suits(suit1, suit2)
    result = self.find {|domino| domino.has_both_suits?(suit1, suit2)}
    return result
  end
  
  def find_highest_double
    if doubles = find_all_doubles
      doubles.max{|a,b| a.suit_of_end1 <=> b.suit_of_end1 }
    end
  end
  
      
  def remove_domino_with_suits!(suit1, suit2)
    domino_to_remove = self.find {|domino| domino.has_both_suits?(suit1, suit2)}
    self.delete(domino_to_remove)
  end  
end