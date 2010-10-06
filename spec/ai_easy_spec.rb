require "spec_helper"

module DominoMofo

  describe AIEasy do    

    context "6-6 on board, 6-3 in hand" do
      before(:each) do 
        @board = Board.new << Domino.new(6,6)
        @hand = Hand.new << Domino.new(6,3) << Domino.new(2,2) << Domino.new(6,1)
        @ai = AIEasy.new(@board, @hand)
      end    
    
      describe "#thought process" do
               
        it "should know how many points are on the board" do
          @board.points.should equal(12)
        end

        it "should play the best domino" 
      end
    end        
  end
end