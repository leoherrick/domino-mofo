class DominoMofo::WinningPlay < DominoMofo::Play
  include DominoMofo
  def initialize(player, game, domino_played, domino_played_on)
    @player = player
    @domino = domino_played
    @domino_played_on = domino_played_on
    @game = game
    @game.plays << self
    @number = @game.plays.length
    @player.hand.delete(@domino)
    add_observer( @game.board ) #makes plays 
    add_observer( @game.play_announcer ) #declares knocks, plays, leadouts
    add_observer( @game.match.scorecard ) #announces scoring plays
    add_observer( @game ) #game over
    changed
    notify_observers( self )
  end
end
