require "spec_helper"

module DominoMofo
 
  describe Board do
    
    specify { should be_kind_of(DominoGroup) }
      
    describe "#knows what suits are in play" do
      
      context "board has four ends (a 3, 4, and two 5s)" do
        it "should know the 3, 4, and 5 are in play"
      end
      
      context "board has two ends (a 3 and 4)" do
        it "should know the 3 and 4 are in play"
      end
  
      context "board has two ends (a 3 and 4) and a 6-6 as the spinner" do
        it "should know the 3, 4, and 6 are in play"
      end
      
      context "board has three ends (a 3, 4, and 5) and a 6-6 as the spinner" do
        it "should know the 3, 4, 5, and 6 are in play"
      end
      
      context "board has two single ends (a 3 and 4), one double end (a 5-5), and a 6-6 as the spinner" do
        it "should know the 3, 4, 5, and 6 are in play"
      end
    end
      
    describe "#knows the score" do
      
      context "board has a 3-4" do
        before(:each) do
          subject << Domino.new(3,4)
        end
        
        it "should have a score of 7" do
          subject.score.should equal(7)
        end
      end
    end    
  end
end