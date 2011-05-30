module DominoMofo
  
  class Scorecard
    attr_reader :match, :scores
    
    def initialize(players)
      @scores = {}
      players.each do |p|
        @scores[p.name] = 0
      end
    end
    
    
    def update ( play )
      total_score = play.game.board.total_score
      if (total_score % 5 == 0) && (total_score != 0) && !play.is_a?(Knock)
        name = play.player.name
        score = play.game.board.total_score
        @scores[name] += score
        puts "****** #{name} just scored #{score} points! ******"
      end
    end
            
  end
end