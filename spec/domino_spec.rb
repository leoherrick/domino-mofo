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
        dc = DominoConnector.new
        dc.connect_two_dominoes_by_suit(domino1, domino2, 2)
        domino1.should be_connected
      end
    end
    
    describe "#find" do    
      
      describe "find end of given suit" do
        context "when domino is the 1-2" do
          it "should return the 2-end if provided a 2" do
            result = domino1.find_end_of_suit(2)
            result.should be_kind_of(End)
            result.suit.should equal(2)
          end
        end            
      end
      
      describe "finds all open ends" do
        context "when domino has two open ends" do
          it "should return two ends" do
            domino1.find_all_open_ends.should have(2).ends
          end
        end
        context "when domino has one open end" do
          before(:each) do
            @domino_with_one_open_end = Domino.new(4,5)
            @domino_with_one_open_end.find_end_of_suit(5).connected_to = true
          end          
          
          it "should return just one end" do
            @domino_with_one_open_end.find_all_open_ends.should have(1).end
          end
        end
      end
      
      describe "finds open end of given suit" do
        context "when a 5-5 has one open and one closed end" do
          before(:each) do
            @five_five = Domino.new(5,5)
            @five_five.find_end_of_suit(5).connected_to = true
          end
          
          it "should return the open end" do
            @five_five.find_all_open_ends.should have(1).open_end
            @five_five.find_open_end_of_suit(5).should be_open
          end
        end
      end
    end        
    
    describe "#score" do
      
      context "when a 5-4 has an open 4-end and closed 5-end" do
        before(:each) do
          @five_four = Domino.new(5,4)
          @five_four.find_end_of_suit(5).connected_to = true
        end
        
        it "should add 4 to the score of the board" do
          @five_four.score.should equal(4)
        end
      end
      
      context "when a 5-5 has one open and one closed end" do
        before(:each) do
          @five_five = Double.new(5,5)
          @five_five.find_end_of_suit(5).connected_to = true
        end
  
        it "should add 10 to the score of the board" do
          @five_five.score.should equal(10)
        end
      end
    end
  end
end
