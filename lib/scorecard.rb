module DominoMofo
  
  class Scorecard
    @players
    @houses
    attr_reader :players, :houses
    
    def initialize (players, houses)
      @players = players
      @houses = houses
    end
    
  end
end