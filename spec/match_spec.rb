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
    
    describe "players" do
      context "by default" do
        it "should have 4" do
          @match.players.should have(4).players
        end
      end
    end
  end
end