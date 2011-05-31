module DominoMofo
  
  class Scorecard
    include Observable
    
    attr_reader :match, :scores
    
    def initialize(players)
      @scores = {}
      players.each do |p|
        @scores[p.name] = 0
      end
      score_announcer = ScorecardAnnouncer.new(STDOUT)
      add_observer(score_announcer)
    end  

    def update ( play )
      total_score = play.game.board.total_score
      if (total_score % 5 == 0) && (total_score != 0) && !play.is_a?(Knock)
        name = play.player.name
        score = play.game.board.total_score
        add_score_to_player_by_name(score, name)
      end
    end
    
    def add_score_to_player_by_name(score, player_name)
      @scores[player_name] += score
      changed
      notify_observers(player_name, score, self)
    end
            
  end
end