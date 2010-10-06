require "spec_helper"

module DominoMofo
  describe Match do 
    before(:each) { @match = Match.new }
    
    it "should have a scorecard" do
      @match.scorecard.should be_true
    end
  
    it "should have an active game" do
      @match.active_game.should be_true
    end
    
    context "#default setup" do
      
      it "should have a scorecard w/ 4 players and 3 houses" do
        scorecard = @match.scorecard
        scorecard.players.should equal(4)
        scorecard.houses.should equal(3)        
      end
    end        
  
    context "#with custom number of players and houses" do
       before(:each) do
        @match1 = Match.new(players = 3, houses = 5)
        @match2 = Match.new(players = 2, houses = 4)
      end 

      it "should have a scorecard w/ 3 players and 5 houses" do
        scorecard1 = @match1.scorecard
        scorecard2 = @match2.scorecard
        scorecard1.players.should equal(3) 
        scorecard1.houses.should equal(5)
        scorecard2.players.should equal(2)
        scorecard2.houses.should equal(4)
      end
    end
  end
end