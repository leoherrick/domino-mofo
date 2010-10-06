require "spec_helper"

module DominoMofo
  
  describe Domino do 
    
    let(:domino1) { Domino.new(1,2) }
    let(:domino2) { Domino.new(2,3) }
    
    it "has two ends" do
      domino1.ends.should have(2).ends
    end
    
    it "knows if is of suit" do
      domino1.should have_suit(2)
      domino2.should have_suit(3)
      domino1.should_not have_suit(3)
    end
    
    it "knows if is double" do
      domino1.should_not be_a_double
      Domino.new(2,2).should be_a_double      
    end      
    
    it "knows if it is a certian domino" do
      domino1.should be_domino_with_ends(1,2)
      domino1.should be_a_domino_with_ends(2,1)
      domino1.should_not be_a_domino_with_ends(2,2)
      domino1.should_not be_a_domino_with_ends(1,4)
    end
    
    it "knows if it's sides are unconnected" do
      domino1.should have_open_end
    end
    
    it "returns all open sides" do
      domino1.open_ends.should have(2).ends
    end
    
  end
end
