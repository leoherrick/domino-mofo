module DominoMofo
  class Endgame    
    include Observable
        
    def initialize(game, match, winning_player)
      
      changed
      notify_observers( self )
    end
  end
end