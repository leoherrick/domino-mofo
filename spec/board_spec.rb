require "spec_helper"

module DominoMofo
 
  describe Board do
        
    it { should be_kind_of(DominoGroup) }
    
    before(:each) { @board = one_one_pinwheel }
    
    it "should know what suits are in play" do
      @board.suits_in_play.should include(2)
      @board.suits_in_play.should include(3)
      @board.suits_in_play.should include(4)
      @board.suits_in_play.should include(5)
    end
    
    it "should know the score" do
      @board.score.should equal(14)
    end
    
    it "should find domino of given suit" do
        @board.find_domino_with_playable_suit(5).should have_both_ends(5,1)
    end
  end
end