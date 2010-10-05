module DominoMofo
  
  class Match
    @players
    @houses
    @scorecard
    @active_game
    attr_reader :scorecard, :active_game
    attr_writer :active_game
    
    def initialize options
      @players = options[:players] || 4
      @houses = options[:houses] || 3
      @scorecard = Scorecard.new(@players, @houses)
      @active_game = Game.new({:players => @players})
    end    
  end
end