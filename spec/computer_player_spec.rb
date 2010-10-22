require "spec_helper"

module DominoMofo
  describe ComputerPlayer do

    before(:each) do
      match = Match.new
      @computer_player = ComputerPlayer.new(match)
    end
    
    it "should be of the 'Player' class" do
      @computer_player.kind_of?(Player).should be_true
    end
    
  end
end