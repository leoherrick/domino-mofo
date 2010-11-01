module DominoMofo
  
  class Match

    attr_reader :scorecard, :number_of_players, :number_of_houses, :controller
    attr_accessor :current_game, :players, :dom
    
    def initialize(number_of_players = 4, number_of_houses = 3)
      @number_of_players = number_of_players
      @number_of_houses = number_of_houses
      @players = MatchPlayerFactory.new(self).create_player_group
      @scorecard = Scorecard.new(self)
      @current_game = Game.new(self)
      @controller = MatchController.new(self)
    end
    
    def change_output output
      @controller = MatchController.new(self, output)
    end
  end
end