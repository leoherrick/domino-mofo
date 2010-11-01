require "spec_helper"

module DominoMofo
  
  describe Spinner do
    four_four = Spinner.new(4)
    
    it "should have four ends" do
      four_four.ends.should have(4).ends
    end

    it "should score all pips if no sides are connected" do
      four_four.score.should equal(8)
    end
    
    it "should score all pips if one side is connected" do
      four_four.ends[0].connected_to = Object.new
      four_four.score.should equal(8)
    end
    
    it "should score no pips score if 2 thru 4 sides are connected" do
      four_four.ends[1].connected_to = Object.new
      four_four.score.should equal(0)
      four_four.ends[2].connected_to = Object.new
      four_four.score.should equal(0)
      four_four.ends[3].connected_to = Object.new
      four_four.score.should equal(0)
    end
  end
end
