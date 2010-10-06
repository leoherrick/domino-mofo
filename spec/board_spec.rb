require "spec_helper"

module DominoMofo
 
  describe Board do 
    
    before(:each) {@board = Board.new}
    
    it "holds dominoes" do
      @board << Domino.new(6,6)
      @board.should have_exactly(1).domino
    end
    
    it "should know how many points are on the board" do
      @board << Domino.new(6,6)
      @board.points.should equal(12)
    end
    
    it "accepts a lead-out domino" do
      six_six = Domino.new(6,6)
      expect {
        @board.place_lead(six_six)
      }.to change{
        @board.length
      }.from(0).to(1)
      @board.has_domino_with_ends?(6,6).should be_true
    end
        
  end
  
end