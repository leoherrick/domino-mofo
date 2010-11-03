require "spec_helper"

module DominoMofo
  
  describe Ai do     
    before(:each) do
      establish_stubs
    end
    
    describe "#has_play?" do        
      it "should be true if has 1+ playable dominoes in its hand" do
        board_has_02_and_hand_has_12_43_54
        @ai.has_play?.should be_true
        board_has_02_and_hand_has_12_43_52
        @ai.has_play?.should be_true
      end
      it "should be false if none of the suits in it's hand match suits on the board" do
        board_has_00_and_hand_has_12_43_52
        @ai.has_play?.should be_false
      end
      it "should be false if the only matching suits in it's hand, match closed ends on the board" do
        board_has_12_24_and_hand_has_20_33_25
        @ai.has_play?.should be_false        
      end
      it "should be true if board is empty but has dominoes in its hand" do
        board_is_empty_and_hand_has_12_43_52
        @ai.has_play?.should be_true
      end
    end
        
    describe "#domino_to_play" do        
      it "should return first domino if it has >1 playable dominoes in its hand" do
        board_has_02_and_hand_has_12_43_52
        @ai.domino_to_play.should have_both_suits(1,2)
      end
    end
    
    describe "#domino_to_play_on" do
      it "should pick the first domino with open end matching the suit of the domino to play" do
        board_has_12_24_and_hand_has_10_33_54
        @ai.domino_to_play_on.should have_both_suits(2,1)
      end
    end
    
    describe "#suit_to_connect" do
      it "should pick suit matching one end of the domino_to_play and an open end of the domino_to_play_on" do
        board_has_02_and_hand_has_12_43_52
        @ai.suit_to_connect.should equal(2)
        
        board_has_12_24_and_hand_has_14
        @ai.domino_to_play.should have_both_suits(1,4)
        @ai.domino_to_play_on.should have_both_suits(1,2)
        @ai.suit_to_connect.should equal(1)
      end
    end
    
    def establish_stubs
      #set up doubles and stubs
      @game = double('game')
      @match = double('match')
      @match.stub(:current_game).and_return(@game)
      @cpu = double('cpu')
      @cpu.stub(:match).and_return(@match)
      @ai = Ai.new(@cpu)
    end


  def board_has_02_and_hand_has_12_43_54
    board = Board.new << Domino.new(0,2)
    hand = Hand.new << Domino.new(1,2) << Domino.new(4,3) << Domino.new(5,4)
    @game.stub(:board).and_return(board)
    @cpu.stub(:hand).and_return(hand)
  end

    def board_is_empty_and_hand_has_12_43_52
      board = Board.new
      hand = Hand.new << Domino.new(1,2) << Domino.new(4,3) << Domino.new(5,2)
      @game.stub(:board).and_return(board)
      @cpu.stub(:hand).and_return(hand)
    end

    def board_has_02_and_hand_has_12_43_52
      board = Board.new << Domino.new(0,2)
      hand = Hand.new << Domino.new(1,2) << Domino.new(4,3) << Domino.new(5,2)
      @game.stub(:board).and_return(board)
      @cpu.stub(:hand).and_return(hand)
    end

    def board_has_12_24_and_hand_has_20_33_25
      board = Board.new << Domino.new(1,2) 
      board.play_domino_on_board_by_suit(board.find_domino_with_suits(1,2), Domino.new(2,4), 2)
      hand = Hand.new << Domino.new(2,0) << Double.new(3) << Domino.new(2,5)
      @game.stub(:board).and_return(board)
      @cpu.stub(:hand).and_return(hand)
    end

    def board_has_12_24_and_hand_has_10_33_54
      board = Board.new << Domino.new(1,2) 
      board.play_domino_on_board_by_suit(board.find_domino_with_suits(1,2), Domino.new(2,4), 2)
      hand = Hand.new << Domino.new(1,0) << Double.new(3) << Domino.new(5,4)
      @game.stub(:board).and_return(board)
      @cpu.stub(:hand).and_return(hand)
    end

    def board_has_12_24_and_hand_has_14
      board = Board.new << Domino.new(1,2) 
      board.play_domino_on_board_by_suit(board.find_domino_with_suits(1,2), Domino.new(2,4), 2)
      hand = Hand.new << Domino.new(1,4)
      @game.stub(:board).and_return(board)
      @cpu.stub(:hand).and_return(hand)
    end

    def board_has_00_and_hand_has_12_43_52
      board = Board.new << Double.new(0)
      hand = Hand.new << Domino.new(1,2) << Domino.new(4,3) << Domino.new(5,2)
      @game.stub(:board).and_return(board)
      @cpu.stub(:hand).and_return(hand)
    end
    
  end  
end
  