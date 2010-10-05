require "spec_helper"

module DominoMofo
  describe Match do 

    describe "#initialize" do
      before(:each) { @match = Match.new({}) }
      
      describe "#default setup" do
      
        it "should have a scorecard" do
          @match.scorecard.should be_true
        end
      
        it "should have an active game" do
          @match.active_game.should be_true
        end
      
        it "should have a scorecard w/ 4 players and 3 houses" do
          @scorecard = @match.scorecard
          @scorecard.class.should equal(Scorecard)
          @scorecard.players.should equal(4)
          @scorecard.houses.should equal(3)        
        end
      end        
    
      describe "#optional setup" do
        context "#when given options (3 players to 5 houses)" do
        
          before(:each) { @match = Match.new({:players => 3, :houses => 5 }) }

          it "should have a scorecard w/ 3 players and 5 houses" do
            @scorecard = @match.scorecard
            @scorecard.class.should equal(Scorecard)
            @scorecard.players.should equal(3)
            @scorecard.houses.should equal(5)        
          end
        end
      end
    end
  end
end