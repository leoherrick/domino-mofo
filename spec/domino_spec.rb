require "spec_helper"

module DominoMofo
  
  describe Domino do 
    
    let(:domino1) { Domino.new(1,2) }
    let(:domino2) { Domino.new(2,3) }
    
    it "has two ends" do
      domino1.ends.should have(2).ends
    end
    
    it "tests for suit" do
      domino1.should have_suit(2)
      domino2.should have_suit(3)
      domino1.should_not have_suit(3)
    end
    
    it "tests for double" do
      domino1.should_not be_a_double
      Double.new(2,2).should be_a_double      
    end      
    
    it "tests for both given ends" do
      domino1.should have_both_ends(1,2)
      domino1.should have_both_ends(2,1)
      domino1.should_not have_both_ends(2,2)
      domino1.should_not have_both_ends(1,4)
    end

    it "should find first end of suit" do
      domino1.find_end_of_suit(1).should be_true
    end
    
    describe "#connection" do
      it "can connnect ends to ends of other dominos" do
        domino1.connect_to_domino_by_suit(domino2, 2)
        domino1.find_end_of_suit(2).should be_connected
        domino2.find_end_of_suit(2).should be_connected
      end    
          
      it "tests for openness" do
        domino1.should be_open
      end
    
      it "tests for connectedness" do
        domino1.connect_to_domino_by_suit(domino2, 2)
        domino1.should be_connected
      end
        
      it "returns open ends" do
        domino1.find_all_open_ends.should have(2).ends
      end
    end
        
  end
end
