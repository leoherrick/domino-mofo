require "spec_helper"

module Radbones
  
  describe Player do 
    
    describe "#initialized" do

      it "has an empty hand of dominoes" do
        Player.new(1).hand.class.should == Array
      end
      
      it "is assigned a player number" do
        Player.new(1).number == 1
      end
    end
  end
end
