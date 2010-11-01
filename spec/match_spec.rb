require "spec_helper"

module DominoMofo
  describe Match do 
    before(:each) { @match = Match.new }
    
    describe "number of houses" do

      context "by default" do
        it "should have 3 houses" do
          @match.number_of_houses.should equal(3)
        end
      end

      context "when passed '4' as optional parameter" do
        before(:each) {@match = Match.new(4,4)}
        it "should have 4 houses" do
          @match.number_of_houses.should equal(4)
        end
      end
    end

    describe "number of players" do

      context "by default" do
        it "should have 4 players" do
          @match.players.should have(4).players
        end
      end

      context "when passed '3' as optional parameter" do
        before(:each) {@match = Match.new(3,3)}
        it "should have 3 players" do
          @match.players.should have(3).players
        end
      end
    end
    
    it "should have a scorecard" do
      @match.scorecard.should be_true
    end
  
    it "should have an active game" do
      @match.current_game.should be_true
    end
  end
end