require "spec_helper"

module DominoMofo
  describe HumanPlayer do

    before(:each) do
      match = Match.new
      @human_player = HumanPlayer.new(match)
    end
    
    it "should be of the 'Player' class" do
      @human_player.should be_kind_of(Player)
    end
    
  end
end