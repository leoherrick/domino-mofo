module Radbones
  class Scorecard
    
    attr_reader :scores
    
    def initialize players
        @scores = {}
      players.times do |n|
        name = "player "+(n+1).to_s
        @scores[name] = nil
      end
    end
    
  end
end