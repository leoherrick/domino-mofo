require "spec_helper"

module DominoMofo
  
  describe Double do
    
    describe "scores double" do
      context "when a 5-5 has one open and one closed end" do
        before(:each) do
          @five_five = Double.new(5,5)
          @five_five.find_end_of_suit(5).connected_to = true
        end
        
        it "should add 10 to the score of the board" do
          @five_five.score.should equal(10)
        end
      end
    end
  end
end