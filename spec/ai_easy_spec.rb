require "spec_helper"

module DominoMofo

<<<<<<< HEAD:spec/ai_easy_spec.rb
  describe AIEasy do
=======
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

      end
    end        
>>>>>>> d3463ed586bf1ff199d80c9eaa741b47f57eee4b:spec/ai_easy_spec.rb
  end
end