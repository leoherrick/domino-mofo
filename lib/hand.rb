module DominoMofo
  class Hand < DominoGroup
    include Comparable
    
    def <=>(anOther)
      lockout_value <=> anOther.lockout_value
    end
    
    def lockout_value
      final_values = self.collect{|d| d.final_value}
      final_values.inject{|sum, x| sum + x}
    end
    
  end
end