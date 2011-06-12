module DominoMofo
  class ScorecardAnnouncer < Announcer    
    
    def update(name, score, scorecard)
      puts Decorator.red_background("#{name} just scored #{score} points!")
    end
    
  end
end