module DominoMofo
  
  class MatchController
        
    attr_accessor :dom, :match
    attr_reader :announcer
    
    def initialize (match, output=STDOUT)
      @dom = nil
      @match = match
      @announcer = Announcer.new(output)
    end
        
    def start_match
      @announcer.welcome
      @match.current_game.controller.start_game
    end    
  end
end