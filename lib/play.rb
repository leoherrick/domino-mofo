module DominoMofo
  class Play
    
    include Observable
    attr_accessor :number, :game, :domino, :player
    
    def initialize(player, game, domino_played, domino_played_on, suit)
      @player = player
      @domino = domino_played
      @domino_played_on = domino_played_on
      @suit = suit
      @game = game
      @game.plays << self
      @number = @game.plays.length
      @player.hand.delete(@domino)
      add_observer( @game.match )
      add_observer( @game )      
      add_observer( @game.match.scorecard )
      add_observer( @game.match.announcer )    
      add_observer( @game.queue )  
      changed
      notify_observers( self )
    end
  end
end