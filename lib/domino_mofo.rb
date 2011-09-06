module DominoMofo
end

#dominomofo
  require 'domino_mofo'
#deendencies 
  require 'observer'

#models
  require 'screen'
  require 'decorator'
  require 'announcer'
    require 'scorecard_announcer'
    require 'play_announcer'
  require 'end'
  require 'game'
  require 'match'
  require 'player_group'
  require 'turn_queue'
  require 'scorecard'
  require 'play'
    require 'lead_out'
    require 'knock'
    require 'winning_play'
    require 'draw'

  require 'interface'

  require 'ai'

  require 'domino'
    require 'double' #subclass of domino
      require 'spinner' #subclass of double

  require 'domino_group'
    require 'board' #subclass of domino_group
    require 'boneyard' #subclass of domino_group
    require 'hand' #subclass of domino_group

  require 'player'
    require 'computer_player' #subclass of player
    require 'human_player' #subclass of player
