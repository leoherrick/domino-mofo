require "spec_helper"

module DominoMofo
  
  describe Double do
    four_four = Double.new(4)
   
    it "should have two ends" do
      four_four.ends.should have(2).ends
    end
   
    describe "#scoring" do
      it "should score all pips if no ends are connected" do
        four_four.score.should equal(8)
      end
    
      it "should score all pips if one end is connected" do
        four_four.ends[0].connected_to = Object.new
        four_four.score.should equal(8)
      end
      
      it "should score no pips if both ends are connected" do
        four_four.ends[0].connected_to = Object.new
        four_four.ends[1].connected_to = Object.new
      end
    end   
  end
end