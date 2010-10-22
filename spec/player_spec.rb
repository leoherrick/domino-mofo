require "spec_helper"

module DominoMofo
  
  describe Player do 
    before(:each) do
      @match = Match.new
      @player = Player.new(@match)
    end

    it "should have a hand (of dominoes)" do
      @player.hand.should be_true
    end      
    
    it "should belong to a match" do
        @player.match.should be_true
    end
    
    it "should know if it's in instance of the 'Human' class" do
      human_player = HumanPlayer.new(@match) #subclass of Player
      human_player.should be_human_player
    end

    it "should know if it's in instance of the 'Computer' class" do
      computer_player = ComputerPlayer.new(@match) #subclass of Player
      computer_player.should be_computer_player
    end
        
  end
end
