require "spec_helper"

module DominoMofo
  
  describe Domino do 
    
    let(:domino1) { Domino.new(1,2) }
    let(:domino2) { Domino.new(2,3) }
        
    it "has two ends" do
      domino1.ends.should have(2).ends
    end
    
    describe "#booleans" do
    
      it "should test for suit" do
        domino1.should have_suit(2)
        domino2.should have_suit(3)
        domino1.should_not have_suit(3)
      end
    
      it "should test for double" do
        domino1.should_not be_a_double
        Double.new(2,2).should be_a_double      
      end      
    
      it "should test for both given ends" do
        domino1.should have_both_ends(1,2)
        domino1.should have_both_ends(2,1)
        domino1.should_not have_both_ends(2,2)
        domino1.should_not have_both_ends(1,4)
      end
      
      it "should test for openness" do
        domino1.should be_open
      end
    
      it "should test for connectedness" do
        domino1.connect_to_domino_by_suit(domino2, 2)
        domino1.should be_connected
      end
    end
    
    describe "#find" do    
      
      it "should find end of given suit" do
        domino1.find_end_of_suit(1).should be_true
      end
      
      it "should return all open ends" do
        domino1.find_all_open_ends.should have(2).ends
      end
    end
    
    describe "#connection" do
      it "can connnect to other dominos" do
        expect{ domino1.connect_to_domino_by_suit(domino2, 2)
        }.to change{ domino1.connected?
        }.from(false).to(true)
      end 
    end   
          
            
  end
end
