module DominoMofo
  
  class Match
    @number_of_players
    @number_of_houses
    @players
    @scorecard
    @active_game
    attr_reader :scorecard, :active_game, :players, :number_of_players, :number_of_houses
    attr_writer :active_game, :players
    
    def initialize(number_of_players = 4, number_of_houses = 3)
      @number_of_players = number_of_players
      @number_of_houses = number_of_houses
      match_player_factory = MatchPlayerFactory.new(self)
      @scorecard = Scorecard.new(self)
      @active_game = Game.new(self)
    end  
    
  end
end