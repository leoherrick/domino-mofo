require "spec_helper"

module DominoMofo

  describe Scorecard do 
    before(:each) do
      match = Match.new
      @scorecard = Scorecard.new(match)
    end

    it "should belong to a match" do 
      @scorecard.match.should be_true
    end
    
    it "should display the score for each person" do 
      
    end
    
    it "should display the score in order" do
    end
    
    
  end
  
end
