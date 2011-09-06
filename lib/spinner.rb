class DominoMofo::Spinner < DominoMofo::Double
  include DominoMofo
  def initialize(suit)
    @ends = Array.new 
    4.times { @ends << End.new(suit, self) }
  end
end
