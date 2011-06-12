module DominoMofo
  class PlayAnnouncer < Announcer    
    
    @last_play = nil
    
    def update ( play )
      @last_play = play
      if  play.is_a?(Knock)
        announce_knock
      elsif play.is_a?(LeadOut)
        announce_leadout
      elsif play.is_a?(WinningPlay)
        announce_winning_play
      elsif play.is_a?(Draw)
        announce_draw
      elsif play.is_a?(Play)
        announce_play
      end
    end
    
    def announce_knock 
      puts "#{play.player.name} just #{ Decorator.blue_background( "KNOCKED" ) }"
    end

    def announce_leadout
      puts "#{play.player.name} just lead with the #{ Decorator.blue_background( play.print_domino ) }"
    end
    
    def announce_winning_play
      puts "#{play.player.name} just played thier last domino: #{ Decorator.blue_background( play.print_domino ) }"
    end
    
    def announce_draw
      puts "#{play.player.name} just played #{ Decorator.blue_background( "drew a domino" ) }"
    end
    
    def announce_play
      puts "#{play.player.name} just played the #{ Decorator.blue_background( play.print_domino ) }"
    end
    
    def play 
      @last_play
    end
    
  end  
end