module DominoMofo
  class ScorecardAnnouncer < Announcer    
    
    def update(name, score, scorecard)
      @output.puts("****** #{name} just scored #{score} points! ******")
    end
    
  end
end