module DominoMofo
  class Play    
    include Observable
    
    attr_accessor :number, :game, :domino, :player, :suit, :domino_played_on
    
    def initialize(player, game, domino_played, domino_played_on, suit)
      @player = player
      @domino = domino_played
      @domino_played_on = domino_played_on
      @suit = suit
      @game = game
      @game.plays << self
      @number = @game.plays.length
      @player.hand.delete(@domino)
      add_observer( @game.board ) #makes plays 
      add_observer( @game.play_announcer ) #declares knocks, plays, leadouts
      add_observer( @game.match.scorecard ) #announces scoring plays
      add_observer( @game ) #game over
      add_observer( @game.queue ) #shifts queue
      changed
      notify_observers( self )
    end
    
    def print_domino 
      "[#{@domino.suit_of_end1}|#{@domino.suit_of_end2}]"
    end
    
  end
end