require "spec_helper"

module Radbones
  
  describe Boneyard do
     
    describe "#initialized" do
    
      it "should have have 28 dominos" do 
        Boneyard.new.bones.length.should == 28
      end
      
      it "should have seven of each suit and seven doubles" do 
        boneyard = Boneyard.new
        [1,2,3,4,5,6, "doubles"].each do |suit|
          boneyard.bones.find_all{|domino| domino.is_of_suit?(suit)}.length.should == 7
        end  
      end
    end
    
    describe "# after initialized" do
    
      it "cant tell you it's length" do
        Boneyard.new.length.should == 28
      end
    
      it "can be drawn from" do 
        Boneyard.new.draw.first.class.should == Domino
      end

      it "can be drawn from in multiples" do 
        Boneyard.new.draw(3).length.should == 3
      end
    end
  end
end
