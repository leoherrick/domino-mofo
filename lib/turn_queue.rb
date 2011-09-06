class DominoMofo::TurnQueue < DominoMofo::PlayerGroup
  include DominoMofo
  include Observable
  
  def initialize(player_group)
    player_group.each do |p|
      self << p
      add_observer(p)
    end
  end
  
  def update ( play )
    unless play.game.over?
      shift_queue!
    end
  end
  
  def shift_queue!
    push self.shift
    changed
    notify_observers
  end
  
  def shift_to_player! player
    index(player).times do
      push self.shift
    end
  end
end
