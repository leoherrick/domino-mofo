require "spec_helper"

module DominoMofo
  
  describe Player do 
    before(:each) do
      @player = Player.new
    end

    it "should have a hand of dominoes" do
      @player.hand.should be_true
    end      
    
    it "should know if it's human" do
      human_player = HumanPlayer.new #subclass of Player
      human_player.is_human?.should be_true
    end

    it "should know if it's a computer controlled player" do
      computer_player = ComputerPlayer.new #subclass of Player
      computer_player.is_computer_player?.should be_true
    end
    
  end
end
