module DominoMofo
  
  class Spinner < Double

    def initialize(suit)
      @ends = Array.new 
      4.times { @ends << End.new(suit, self) }
    end
  end
end