require "spec_helper"

module DominoMofo
  describe Scorecard do 

    describe "#general scorekeeping" do 
      
      it "should have a column for each player" do 
        scorecard = DominoMofo::Scorecard.new(4)
        ["1","2","3","4"].each do |number|
          scorecard.scores.key?("player "+number).should be_true
        end
        scorecard.scores.should have(4).columns
      end
          
    end

    describe "#drawing" do 
      it "should be albe to draw the scorecard in house format"
    end
        
    describe "#announcing"   
  end
end
