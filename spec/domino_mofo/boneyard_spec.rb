require "spec_helper"

module DominoMofo
  
  describe Boneyard do

      let(:test_boneyard) {Boneyard.new}

      it { should have(28).dominos }
             
      it "should have seven of each suit and seven doubles" do 
        SUITS = [1,2,3,4,5,6]
        SUITS.each do |suit|
          all_dominos_of_suit = test_boneyard.get_all_dominos_of_suit(suit)
          all_dominos_of_suit.should have(7).dominos
        end  
        test_boneyard.get_all_doubles.should have(7).doubles
      end
      
      it "can be drawn from one at a time" do 
        test_boneyard.draw_one_domino.class.should == Domino 
      end

      it "can be drawn from seven at a time" do 
        test_boneyard.draw_seven_dominos.should have(7).dominos
      end

      it "can retreive all dominos of a suit" do
        all_sixes_in_boneyard = test_boneyard.get_all_dominos_of_suit(6)
        all_sixes_in_boneyard.should have(7).dominos
      end

  end
end
