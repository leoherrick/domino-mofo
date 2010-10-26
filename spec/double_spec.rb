require "spec_helper"

module DominoMofo
  
  describe Double do
    four_four = Double.new(4,4)
   
    describe "#scoring" do
      it "should score all pips if no sides are connected" do
        four_four.score.should equal(8)
      end
    
      it "should score all pips if one side is connected" do
        four_four.ends[0].connected_to = Object.new
        four_four.score.should equal(8)
      end
    end   
   
    describe "#create Spinner" do
      it "should create spinner clone of itself" do
        four_four.should be_kind_of(Double)
        four_four.create_spinner.should be_kind_of(Spinner)
      end
    end
  end
end