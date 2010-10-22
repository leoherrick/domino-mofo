require "spec_helper"

module DominoMofo
  describe Match do 
    before(:each) { @match = Match.new }
    
    it "should have 1 human player" do
      @game.players.find_all { |p| p.class == HumanPlayer }.should have(1).human_player
    end
    
    it "should have a scorecard" do
      @match.scorecard.should be_true
    end
  
    it "should have an active game" do
      @match.active_game.should be_true
    end
  end
end