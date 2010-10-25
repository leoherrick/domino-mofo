require "spec_helper"

module DominoMofo
  
  describe Spinner do
    let(:four_four) {Spinner.new(4,4)}
    
    it "should have four ends" do
      four_four = Spinner.new(4,4)
      four_four.ends.should have(4).ends
    end

    context "no sides are connected" do
      it "should pass it's total value on to the board score" do
        four_four.score.should equal(8)
      end
    end
    
    context "one side is connected" do
      before(:each) {four_four.ends[0].connected_to = Object.new}
      it "shoudl pass it's total value on to the board score" do
        four_four.score.should equal(8)
      end
    end
    
    context "two, three, or four sides are connected" do
      before(:each) do
        four_four.ends[0].connected_to = Object.new
        four_four.ends[1].connected_to = Object.new
      end
      
      it "should pass no score on to the board score" do
        four_four.score.should equal(0)
      end
    end
  end
end
