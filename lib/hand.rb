class DominoMofo::Hand < DominoMofo::DominoGroup
  include DominoMofo
  include Comparable
  
  def <=>(anOther)
    lockout_value <=> anOther.lockout_value
  end
  
  def lockout_value
    rounded_values = self.collect{|d| d.rounded_value}
    rounded_values.inject{|sum, x| sum + x}
  end
  
end
