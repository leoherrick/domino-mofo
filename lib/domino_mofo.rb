#deendencies 
  require 'observer'

#models
  require 'announcer'
  require 'end'
  require 'game'
  require 'match'
  require 'player_group'
  require 'turn_queue'
  require 'scorecard'
  require 'play'
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

    include DominoMofo
    match = Match.new

    match.start_match
    match.current_game.make_cpu_moves
    
    interface = Interface.new
    interface.run(match)
    
  