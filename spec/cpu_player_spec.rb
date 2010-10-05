require "spec_helper"

module DominoMofo
  describe ComputerPlayer do

    before(:each) do
      @computer_player = ComputerPlayer.new
    end
    
    it "should be a computer" do
      @computer_player.is_computer_player?.should be_true
    end
    
    it "should have a hand" do
      @computer_player.hand.should be_true
    end
    
  end
end