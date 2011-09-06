class DominoMofo::Draw < DominoMofo::Play
  include DominoMofo
  
  def initialize(player, game, domino_played, domino_played_on)
    @player = player
    @game = game
    @game.plays << self
    @number = @game.plays.length
    @player.hand << @game.boneyard.draw_one
    
    add_observer( @game.play_announcer ) #declares knocks, plays, leadouts
    changed
    notify_observers( self )
  end
  
end
