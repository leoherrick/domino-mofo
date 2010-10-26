require "spec_helper"

module DominoMofo
  
  describe AiBase do     
    before(:each) do
      establish_stubs
    end
    
    describe "#has a play" do

      context "when board has 0-2 and hand has 1-2, 4-3, 5-2" do
        before(:each) {board_has_02_and_hand_has_12_43_52}
        
        it "should be true" do
          @ai.has_play?.should be_true
        end
      end

      context "when board has 0-0 and hand has 1-2, 4-3, 5-2" do
        before(:each) {board_has_00_and_hand_has_12_43_52}

        it "should be false" do
          @ai.has_play?.should be_false
        end
      end
      
      context "when board is empty and hand has 1-2, 4-3, 5-2" do
        before(:each) {board_is_empty_and_hand_has_12_43_52}
        
        it "should be true" do
          @ai.has_play?.should be_true
        end
      end
    end
    
    describe "#playable dominoes" do
      
      context "when board has 0-2 and hand has 1-2, 4-3, 5-2" do
        before(:each) {board_has_02_and_hand_has_12_43_52}

        it "should include the 1-2 & 5-2" do
          @ai.playable_dominoes.should have_domino_with_both_ends(1,2)
          @ai.playable_dominoes.should have_domino_with_both_ends(5,2)
        end
      end
      
      context "when board has 0-0 and hand has 1-2, 4-3, 5-2" do
        before(:each) {board_has_00_and_hand_has_12_43_52}

        it "should return an empty array" do
          @ai.playable_dominoes.should be_empty
        end
      end
      
      context "when board is empty and hand has 1-2, 4-3, 5-2" do
        before(:each) {board_is_empty_and_hand_has_12_43_52}
        
        it "should include the 1-2, 4-3, and 5-2" do
          @ai.playable_dominoes.should have_domino_with_both_ends(1,2)
          @ai.playable_dominoes.should have_domino_with_both_ends(4,3)
          @ai.playable_dominoes.should have_domino_with_both_ends(5,2)
        end
      end
    end
        
    describe "#the domino it chooses to play" do
      
      context "when board has 0-2 and hand has 1-2, 4-3, and 5-2" do
        before(:each) {board_has_02_and_hand_has_12_43_52}
        
        it "should be the 1-2" do
          @ai.domino_to_play.should have_both_ends(1,2)
        end
      end
    end
    
    describe "#identifies domino to play on" do
      
      context "when board has 1-2 & 2-4 and hand has 1-0, 3-3, and 5-6" do
        before(:each) {board_has_12_24_and_hand_has_10_33_56}

        it "should know it will play on the 1-2" do
          @ai.domino_to_play_on.should have_both_ends(2,1)
        end
      end      
    end
    
    describe "#identify the connecting suit" do
      
      context "when board has 0-2 and hand has 1-2, 4-3, and 5-2" do
        before(:each) {board_has_02_and_hand_has_12_43_52}
        
        it "should know the connecting suit is the 2" do
          @ai.suit_to_connect.should equal(2)
        end
      end
    end
    
    def establish_stubs
      #set up doubles and stubs
      @game = double('game')
      @match = double('match')
      @match.stub(:active_game).and_return(@game)
      @cpu = double('cpu')
      @cpu.stub(:match).and_return(@match)
      @ai = AiBase.new(@cpu)
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

    def board_has_12_24_and_hand_has_10_33_56
      board = Board.new << Domino.new(1,2) << Domino.new(5,6)
      hand = Hand.new << Domino.new(1,0) << Double.new(3,3) << Domino.new(5,6)
      @game.stub(:board).and_return(board)
      @cpu.stub(:hand).and_return(hand)
    end

    def board_has_00_and_hand_has_12_43_52
      board = Board.new << Double.new(0,0)
      hand = Hand.new << Domino.new(1,2) << Domino.new(4,3) << Domino.new(5,2)
      @game.stub(:board).and_return(board)
      @cpu.stub(:hand).and_return(hand)
    end
    
  end  
end
  