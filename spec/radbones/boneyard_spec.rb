require "spec_helper"

module Radbones
  
  describe Boneyard do
    
    let(:boneyard) {Boneyard.new}
    
    describe "#initialized" do
    
      it "should have have 28 dominos" do 
        boneyard.length.should == 28
      end
      
      it "should have seven of each suit and seven doubles" do 
        [1,2,3,4,5,6, "doubles"].each do |suit|
          boneyard.bones.find_all{|domino| domino.is_of_suit?(suit)}.length.should == 7
        end  
      end
    end
    
    describe "#after initialized" do
    
      it "can tell you it's length" do
        boneyard.length.should == 28
      end
    
      it "can be drawn from" do 
        boneyard.draw.first.class.should == Domino
      end

      it "can be drawn from in multiples" do 
        boneyard.draw(3).length.should == 3
      end
    end
  end
end
