require "spec_helper"

module DominoMofo
  describe HumanPlayer do

    before(:each) do
      @human_player = HumanPlayer.new
    end
    
    it "should be human" do
      @human_player.is_human?.should be_true
    end
    
    it "should have a hand" do
      @human_player.hand.should be_true
    end
    
  end
end