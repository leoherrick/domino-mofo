module DominoMofo
  
  class Scorecard
    attr_reader :match, :scores
    
    def initialize(players)
      @scores = {}
      players.each do |p|
        @scores[p.object_id] = 0
      end
    end
    
    
    def update ( play )
      total_score = play.game.board.total_score
      if (total_score % 5 == 0) && (total_score != 0)
        player_id = play.player.object_id
        score = play.game.board.total_score
        @scores[player_id] += score
        puts "****** #{player_id} just scored #{score} points! ******"
      end
    end
            
  end
end