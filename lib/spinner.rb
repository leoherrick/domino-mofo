module DominoMofo
  
  class Spinner < Double

    def initialize(end1, end2)
      @ends = Array.new << End.new(end1, self) << End.new(end2, self) << End.new(end1, self) << End.new(end2, self)
    end
  end
end