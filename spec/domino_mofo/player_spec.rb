require "spec_helper"

module DominoMofo
  
  describe Player do 
    
    describe "#initialized" do

      it "has an empty hand of dominoes" do
        Player.new(1).hand.class.should == Array
      end
      
      it "is assigned a player number" do
        Player.new(1).number.should == 1
      end
      
      it "can discard a domino" do
        player = Player.new(1)
        dom1 = Domino.new(1,1)
        player.hand = [dom1]
        player.hand.should have(1).domino
        player.discard(dom1)
        player.hand.should have(0).dominos
      end
    end
  end
end
