require "spec_helper"

module DominoMofo

  describe BoardController do
        
    describe "places first domino on the board" do

      context "if it places a 4-5 on a clear board" do
        
        before(:each) do
          @board = Board.new
          @board_controller = BoardController.new(@board)
          four_five = Domino.new(4,5)
          @board_controller.lead_out(four_five) 
        end
          
        it "should increment the number of dominoes on the board" do
          @board.should have(1).domino
        end
      
        it "the suits in play should become 4 & 5" do
          @board.suits_in_play.should include(4)
          @board.suits_in_play.should include(5)
        end
      
        it "should bring the total board score to 9" do
          @board.score.should equal(9)
        end
      end
    end
    
    describe "connects new dominoes to the board" do
      context "when the board has a 1-2 and a 2-3 (connected by the two)" do
        before(:each) do
          @board = Board.new
          @board_controller = BoardController.new(@board)
          @one_two = Domino.new(1,2)
          @two_three = Domino.new(2,3)
          @board_controller.lead_out(@one_two) 
          @board_controller.play_domino_on_board_by_suit(@two_three, @one_two, 2) 
        end
      
        context "and the 0-1 is connected to the 1-2" do
          before(:each) do
            @oh_one = Domino.new(0,1)
            @board_controller.play_domino_on_board_by_suit(@oh_one, @one_two, 1) 
          end
        
          it "should have 3 dominoes on the board" do
            @board.should have(3).dominoes
          end

          it "should change the suits in play from [1,3] to [0,3]" do
            @board.suits_in_play.should include(0)
            @board.suits_in_play.should_not include(1)
            @board.suits_in_play.should include(3)
          end
        
          it "should change the board score to 3" do
            @board.score.should equal(3)
          end
        
          it "should change the 1-2 to a connected domino" do
            @one_two.should be_connected
          end

          it "should keep the number of open dominoes at 2" do
            include Board
            @board.dominoes_in_play.should have(2).dominoes
          end
        end        
      
        context "and te 1-1 is connected to the 1-2" do
          before(:each) do
            @one_one = Double.new(1,1)
            @board_controller.play_domino_on_board_by_suit(@one_one, @one_two, 1) 
          end
        
          it "should have 3 dominoes on the board" do
            @board.should have(3).dominoes
          end

          it "the suits in play should [1,3]" do
            @board.suits_in_play.should include(1)
            @board.suits_in_play.should include(3)
          end
        
          it "should change the board score from 4 to 5" do
            @board.score.should equal(5)
          end
        
          it "should establish the 1-1 as the spinner" do
            @board.spinner.should have_both_ends(1,1)
            @board.spinner.should be_kind_of(Spinner)
          end
        end 
      end
    end    
  end
end