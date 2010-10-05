require "spec_helper"

module DominoMofo
 
  describe Line do 
    
    before(:each) {@line = Line.new}
    
    it "holds dominoes" do
      @line.dominoes << Domino.new(6,6)
      @line.dominoes.should have_exactly(1).domino
    end
        
  end
  
end