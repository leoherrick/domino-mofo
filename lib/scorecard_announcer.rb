class DominoMofo::ScorecardAnnouncer < DominoMofo::Announcer    
  include DominoMofo
  def update(name, score, scorecard)
    puts Decorator.red_background("#{name} just scored #{score} points!")
  end
  
end
