require "spec_helper"

module DominoMofo
  
  describe Boneyard do
    
    before(:each) {@boneyard = Boneyard.new}
    
    it { should have(28).dominos }
           
    it "should have seven of each suit" do 
      SUITS = [1,2,3,4,5,6]
      SUITS.each do |suit|
        all_dominos_of_suit = @boneyard.get_all_dominoes_of_suit(suit)
        all_dominos_of_suit.should have(7).dominos
      end  
    end

    it "should have seven doubles" do
      @boneyard.get_all_doubles.should have(7).doubles
    end
    
    it "should be randomly shuffled" do
      unshuffled_boneyard = @boneyard
      @boneyard.wash!
      shuffled_boneyard = @boneyard
      
      unshuffled_boneyard.each do |domino|
        shuffled_boneyard.include?(domino).should be_true
      end
      unshuffled_boneyard.length.should equal(shuffled_boneyard.length)
      shuffled_boneyard != unshuffled_boneyard     
    end
    
    it "can be drawn from one at a time" do 
      @boneyard.draw_one.should be_true
    end

    it "can be drawn from seven at a time" do 
      @boneyard.draw_seven.should have(7).dominos
    end

  end
end
