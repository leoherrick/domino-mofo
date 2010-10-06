require "spec_helper"

module DominoMofo
 
  describe Board do 
    
    before(:each) {@board = Board.new}
    
    it "holds dominoes" do
      @board.dominoes << Domino.new(6,6)
      @board.dominoes.should have_exactly(1).domino
    end
    
    it "accepts a lead-out domino" do
      six_six = Domino.new(6,6)
      expect {
        @board.place_lead(six_six)
      }.to change{
        @board.dominoes.length
      }.from(0).to(1)
      @board.dominoes.has_domino_with_sides?(6,6).should be_true
    end
        
  end
  
end