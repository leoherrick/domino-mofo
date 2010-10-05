require "spec_helper"

module DominoMofo
  
  describe Domino do 
    
    let(:domino1) { Domino.new(1,2) }
    let(:domino2) { Domino.new(2,3) }
    
    describe "#identification" do
    
      it "knows if is of suit" do
        domino1.has_suit?(2).should be_true
        domino1.has_suit?(3).should be_false
      end
      
      it "knows if is double" do
        domino1.is_double?.should be_false      
        Domino.new(2,2).is_double?.should be_true            
      end      
      
      it "knows if it is a certian domino" do
        domino1.is_domino?(1,2).should be_true
        domino1.is_domino?(2,1).should be_true
        domino1.is_domino?(2,2).should be_false
        domino1.is_domino?(1,4).should be_false
      end
    end
  end
end
