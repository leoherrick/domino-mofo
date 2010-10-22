module DominoMofo
  
  class Match
    @players
    @number_of_houses
    @scorecard
    @active_game
    attr_reader :scorecard, :active_game, :players
    attr_writer :active_game
    
    def initialize(number_of_players = 4, number_of_houses = 3)
      player_factory = PlayerFactory.new(number_of_players, self)
      @players = player_factory.create_players
      @number_of_houses = number_of_houses
      @scorecard = Scorecard.new(self)
      @active_game = Game.new(self)
    end  
    
  end
end