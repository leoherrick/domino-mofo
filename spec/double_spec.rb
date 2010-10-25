require "spec_helper"

module DominoMofo
  
  describe Double do
    let(:four_four) {Double.new(4,4)}
   
    describe "return score" do  
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
    
      context "both sides are connected" do
        before(:each) do
          four_four.ends[0].connected_to = Object.new
          four_four.ends[1].connected_to = Object.new
        end
      
        it "should pass no score on to the board score" do
          four_four.score.should equal(0)
        end
      end
    end
    
    describe "create Spinner" do
      it "should create spinner clone of itself" do
        four_four.should be_kind_of(Double)
        four_four.create_spinner.should be_kind_of(Spinner)
      end
    end
  end
end