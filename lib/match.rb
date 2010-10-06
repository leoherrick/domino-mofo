module DominoMofo
  
  class Match
    @players
    @houses
    @scorecard
    @active_game
    attr_reader :scorecard, :active_game
    attr_writer :active_game
    
    def initialize(players = 4, houses = 3)
      @players = players
      @houses = houses
      @scorecard = Scorecard.new(players, houses)
      @active_game = Game.new(players)
    end  
    
  end
end