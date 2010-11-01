require "spec_helper"

module DominoMofo
  
  describe DominoConnector do

    describe "#connnects two dominoes by a suit" do
      
      context "when the 1-2 and 2-3 are connected by the 2" do
        before(:each) do
          @one_two = Domino.new(1,2)
          @two_three = Domino.new(2,3)
          subject.connect_two_dominoes_by_suit(@one_two, @two_three, 2)
        end
        
        it "should connect the 2-end of the 1-2 to the 2-end of the 2-3" do
          @one_two.find_end_of_suit(2).connected_to.should === @two_three.find_end_of_suit(2)
          @two_three.find_end_of_suit(2).connected_to.should === @one_two.find_end_of_suit(2)
        end
        
        it "should make both dominoes 'connected' dominoes" do
          @one_two.should be_connected
          @two_three.should be_connected
        end
        
        it "should leave the 1-end of the 1-2 open" do
          @one_two.find_end_of_suit(1).should be_open
        end

        it "should leave the 3-end of the 2-3 open" do
          @two_three.find_end_of_suit(3).should be_open
        end
      end 
    end
    
    describe "connecting doubles" do 
      context "when the 2-3 is connected to the 2-2 by the 2" do
        before(:each) do
          @two_three = Domino.new(2,3)
          @two_two = Double.new(2)
          subject.connect_two_dominoes_by_suit(@two_three, @two_two, 2)
        end
        
        it "should leave the 3-end of the 2-3 open and 2-end connected" do
          @two_three.find_end_of_suit(3).should be_open
          @two_three.find_end_of_suit(2).should be_connected
        end

        it "should leave one end of 2-2 open and one end connected" do
          @two_two.find_all_open_ends.should have(1).open_end
          @two_two.ends.find_all{|e| e.connected?}.should have(1).connected_end
        end
      end
    end
    
    describe "connecting spinners" do
      context "when the 2-3, 2-4, and 2,5 are connected to the 2-2 spinner" do
        before(:each) do
          @two_three = Domino.new(2,3)
          @two_four = Domino.new(2,4)
          @two_five = Domino.new(2,5)
          @two_two = Spinner.new(2)
          subject.connect_two_dominoes_by_suit(@two_three, @two_two, 2)
          subject.connect_two_dominoes_by_suit(@two_four, @two_two, 2)
          subject.connect_two_dominoes_by_suit(@two_five, @two_two, 2)
        end
        
        it "should leave the 3-end of the 2-3 open and 2-end connected" do
          @two_three.find_end_of_suit(3).should be_open
          @two_three.find_end_of_suit(2).should be_connected
        end

        it "should leave the 4-end of the 2-4 open and 2-end connected" do
          @two_four.find_end_of_suit(4).should be_open
          @two_four.find_end_of_suit(2).should be_connected
        end

        it "should leave the 5-end of the 2-5 open and 2-end connected" do
          @two_five.find_end_of_suit(5).should be_open
          @two_five.find_end_of_suit(2).should be_connected
        end

        it "should leave two ends of 2-2 open and two ends connected" do
          @two_two.find_all_open_ends.should have(1).open_end
          @two_two.ends.find_all{|e| e.connected?}.should have(3).connected_end
        end
      end
    end  
      
  end   
end
