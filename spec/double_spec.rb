require "spec_helper"

module DominoMofo
  
  describe Double do
    four_four = Double.new(4)
   
    it "should be kind of Domino" do
      four_four.should be_kind_of(Domino)
    end
   
    describe "#score" do
      it "should score all pips if either 0 or 1 ends are connected" do
        four_four.score.should equal(8)
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