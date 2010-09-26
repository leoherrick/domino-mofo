require "spec_helper"

module DominoMofo
  
  describe Domino do 
    
    let(:domino1) { Domino.new(1,2) }
    let(:domino2) { Domino.new(2,3) }
    
    describe "#identification" do
    
      it "knows if it's of suit 0-6 or 'doubles'" do
        domino1.has_suit(2).should be_true
        domino1.has_suit(3).should be_false
        domino1.is_double.should be_false      
        Domino.new(2,2).is_double.should be_true            
      end      
    end
    
    it "can connect one of it's sides to the side of another domino" do
      domino1.connect_to_another_by_suit(domino2, 2)
      domino1.return_a_side_matching_suit(2)[:connected_to].should === domino2
      domino2.return_a_side_matching_suit(2)[:connected_to].should === domino1
    end
     
    it "will tell you if it has an unmatched side of a certian number" do
      domino1.connect_to_another_by_suit(domino2, 2)
      domino1.has_unconnected_of_suit(1).should be_true
      domino1.has_unconnected_of_suit(2).should be_false
    end
     
    it "if given a number, will return a matching side" do
      domino1.return_a_side_matching_suit(2)[:val].should == 2
    end
    
    it "will return an array of it's unconnected suits" do 
      domino1.get_unconnected_sides.class.should == Array
      domino1.get_unconnected_sides.should have(2).sides
      domino1.get_unconnected_sides.should include(1) && include(2)
    end
  end
end
