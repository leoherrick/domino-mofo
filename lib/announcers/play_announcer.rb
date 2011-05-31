module DominoMofo
  class PlayAnnouncer < Announcer    
    
    def update ( play )
      if  play.is_a?(Knock)
        @output.puts("#{play.player.name} just KNOCKED")
      elsif play.is_a?(LeadOut)
        @output.puts("#{play.player.name} just lead with the [#{play.domino.suit_of_end1}|#{play.domino.suit_of_end2}]")
      elsif play.is_a?(WinningPlay)
        @output.puts("#{play.player.name} just played thier last domino: [#{play.domino.suit_of_end1}|#{play.domino.suit_of_end2}]")      
      else
        @output.puts("#{play.player.name} just played the [#{play.domino.suit_of_end1}|#{play.domino.suit_of_end2}]")
      end
    end
    
  end  
end