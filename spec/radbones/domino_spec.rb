require "spec_helper"

module Radbones
  
  describe Domino do 

    it "has two sides" do
      Domino.new(1,2).sides.length == 2
    end
    
    it "can tell you if it's of a certian suit (including the 'doubles' suit)" do
      Domino.new(1,2).is_of_suit?(2).should == true
      Domino.new(1,2).is_of_suit?(3).should == false
      Domino.new(1,2).is_of_suit?("doubles").should == false      
      Domino.new(2,2).is_of_suit?("doubles").should == true            
    end
  end
end
