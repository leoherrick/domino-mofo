require "spec_helper"

module Radbones
  describe Scorecard do 

    describe "#general scorekeeping" do 
      
      it "should have a column for each player" do 
        scorecard = Radbones::Scorecard.new(4)
        ["1","2","3","4"].each do |number|
          scorecard.scores.key?("player "+number).should == true
        end
        scorecard.scores.length.should == 4
      end
            
    end

    describe "#drawing" do 
      it "should be albe to draw the scorecard in house format"
    end
        
    describe "#announcing" do
    end    
  end
end
