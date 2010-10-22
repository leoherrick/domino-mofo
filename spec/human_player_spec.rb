require "spec_helper"

module DominoMofo
  describe HumanPlayer do

    before(:each) do
      match = Match.new
      @human_player = HumanPlayer.new(match)
    end
    
    it "should be human" do
      @human_player.human_player?.should be_true
    end
    
    it "should have a hand" do
      @human_player.hand.should be_true
    end
    
  end
end