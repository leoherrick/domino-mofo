module DominoMofo
  
  class Scorecard
    include Observable
    
    attr_reader :match, :scores
    
    def initialize(players)
      @scores = {}
      players.each do |p|
        @scores[p.name] = 0
      end
      score_announcer = ScorecardAnnouncer.new
      add_observer(score_announcer)
    end  

    def update ( play )
      total_score = play.game.board.total_score
      if (total_score % 5 == 0) && (total_score != 0) && !play.is_a?(Knock)
        player = play.player
        score = play.game.board.total_score
        add_score_to_player_by_name(score,player)
      end
    end
    
    def player_with_highest_score
      @scores.max.first
    end
    
    def add_score_to_player_by_name(score, player)
      name = player.name
      player.score += score
      @scores[name] += score
      changed
      notify_observers(name, score, self)
    end
            
  end
end