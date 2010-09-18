require "spec_helper"

module Radbones
  
  describe Player do 
    
    describe "#initialized" do
      it "has an empty hand of dominoes" do
        Player.new.hand.class.should == Array
      end
    end
  end
end
