module DominoMofo
  
  class Match
    @number_of_players
    @number_of_houses
    @players
    @scorecard
    @active_game
    attr_reader :scorecard, :active_game, :players, :number_of_players, :number_of_houses
    attr_writer :active_game, :players
    
<<<<<<< HEAD:lib/match.rb
    def initialize(players = 4, houses = 3)
      @players = players
      @houses = houses
=======
    def initialize(number_of_players = 4, number_of_houses = 3)
      @number_of_players = number_of_players
      @number_of_houses = number_of_houses
      match_player_factory = MatchPlayerFactory.new(self)
>>>>>>> d3463ed586bf1ff199d80c9eaa741b47f57eee4b:lib/match.rb
      @scorecard = Scorecard.new(self)
<<<<<<< HEAD:lib/match.rb
      @active_game = Game.new(players)
=======
      @active_game = Game.new(self)
>>>>>>> d3463ed586bf1ff199d80c9eaa741b47f57eee4b:lib/match.rb
    end  
    
  end
end