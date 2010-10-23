require "spec_helper"

module DominoMofo
  describe ComputerPlayer do

    match = Match.new
    subject = ComputerPlayer.new(match)
      
    it "should be of the 'Player' class" do
      subject.kind_of?(Player).should be_true
    end

    it "should have an AI module" do
      subject.ai.should be_true
    end 
    
  end
end