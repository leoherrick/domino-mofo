require "spec_helper"
include SpecHelper
module DominoMofo
 
  describe Board do

    it "should be a kind of domino group" do
      subject.should be_kind_of(DominoGroup)
    end
    
    before(:each) { @board = board_with_11_spin_and_12_13_14_15 }
    
    describe "#dominoes_in_play" do
      
      it "should return all dominoes with 1+ open ends" do
        @board = board_with_11_spin_and_12_13_14_15
        @board.dominoes_in_play.should have_domino_with_suits(1,2)
        @board.dominoes_in_play.should have_domino_with_suits(1,3)
        @board.dominoes_in_play.should have_domino_with_suits(1,4)
        @board.dominoes_in_play.should have_domino_with_suits(1,5)
      end
      
      it 'should not return dominoes on board with two ends' do
        @board = board_with_11_spin_and_12_13_14_15 
        @board.dominoes_in_play.should_not have_domino_with_suits(1,1)
      end
    end
    
    describe "#suits_in_play" do
      
      it "should know what suits are in play" do
        @board = board_with_11_spin_and_12_13_14_15
        @board.suits_in_play.should include(2)
        @board.suits_in_play.should include(3)
        @board.suits_in_play.should include(4)
        @board.suits_in_play.should include(5)
      end
      
      it "should know the spinner is still in play if it has less than 4 closed sides" do
        @board = board_with_11_spin_and_12_13_14
        @board.suits_in_play.should include(1)        
      end
    end

    describe "#score" do
      
      it "should add scores of all scoring dominoes" do
        @board = board_with_11_spin_and_12_13_14_15
        @board.total_score.should equal(14)
      end
      
      it "should not add the spinner's score if it has 3 closed ends" do
        @board = board_with_11_spin_and_12_13_14
        @board.total_score.should equal(9)
      end
      
      it "should count boths sides of doubles if they're on the ends" do
        @board = board_with_11_spin_and_12_13_14_44
        @board.total_score.should equal(13)
      end
    end

    describe "#lead_out" do
      before(:each){ @board = Board.new }
      
      it "should add a domino to the board" do
        expect{
          @board.lead_out(Domino.new(1,2))
        }.to change{
          @board.length
        }.from(0).to(1)
      end
      
      it "should promote it to a spinner if it's a double" do 
          @board.lead_out(Double.new(2))
          @board.should have_domino_with_suits(2,2)
          @board.find_domino_with_suits(2,2).should be_instance_of(Spinner)
      end
    end
    
    describe "#play_domino_on_board_by_suit" do    
        
      it "should add a domino to the board" do
        @board = board_with_11_spin_and_12_13_14_15
        expect{
          @board.play_domino_on_board_by_suit(Domino.new(5,2), @board.find_domino_with_suits(1,5), 5)
        }.to change{
          @board.length
        }.by(1)
      end
      
      it "should connect both ends of the dominoes involved" do
        expect{
          @board = board_with_11_spin_and_12_13_14_15
          @board.play_domino_on_board_by_suit(Domino.new(5,2), @board.find_domino_with_suits(1,5), 5)
        }.to change{
          @board.find_domino_with_suits(1,5).open?
        }.from(true).to(false)     
           
        @board = board_with_11_spin_and_12_13_14_15
        five_two = Domino.new(5,2)
        @board.play_domino_on_board_by_suit(five_two, @board.find_domino_with_suits(1,5), 5)
        five_two.should be_connected
      end
      
      it "should change the score" do
        @board = board_with_11_spin_and_12_13_14_15
        expect{
          @board.play_domino_on_board_by_suit(Domino.new(5,2), @board.find_domino_with_suits(1,5), 5)
        }.to change{
          @board.total_score
        }.from(14).to(11)
      end
      
      it "should promote a domino to spinner if it's the first double" do
        @board = board_with_12_25_56
        @board.play_domino_on_board_by_suit(Double.new(6), @board.find_domino_with_suits(5,6), 6)
        @board.should have_domino_with_suits(6,6)
        @board.find_domino_with_suits(6,6).should be_instance_of(Spinner)
      end
    end
    
    it "playable_domino_of_suit" do
      @board = board_with_11_spin_and_12_13_14_15
      @board.playable_domino_of_suit(5).should have_both_suits(5,1)
    end
  end
  
  #1-1 spinner w/ 1-2, 1-3, and 1-4
  def board_with_11_spin_and_12_13_14
    board = Board.new
    board.lead_out(Double.new(1))
    board.play_domino_on_board_by_suit(Domino.new(1,2), board.find_domino_with_suits(1,1), 1)
    board.play_domino_on_board_by_suit(Domino.new(1,3), board.find_domino_with_suits(1,1), 1)
    board.play_domino_on_board_by_suit(Domino.new(1,4), board.find_domino_with_suits(1,1), 1)
    board
  end
  
  #1-1 spinner w/ 1-2, 1-3, 1-4, and 1-5
  def board_with_11_spin_and_12_13_14_15
    board = board_with_11_spin_and_12_13_14
    board.play_domino_on_board_by_suit(Domino.new(1,5), board.find_domino_with_suits(1,1), 1)
    board
  end

  #1-1 spinner w/ 1-2, 1-3, 1-4, and 4-4
  def board_with_11_spin_and_12_13_14_44
    board = board_with_11_spin_and_12_13_14
    board.play_domino_on_board_by_suit(Double.new(4), board.find_domino_with_suits(1,4), 4)
    board
  end
  
  def board_with_12_25_56
    board = Board.new
    board.lead_out(Domino.new(1,2))
    board.play_domino_on_board_by_suit(Domino.new(2,5), board.find_domino_with_suits(1,2), 2)
    board.play_domino_on_board_by_suit(Domino.new(5,6), board.find_domino_with_suits(2,5), 5)
    board
  end

end