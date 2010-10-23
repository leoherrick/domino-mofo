require "spec_helper"

module DominoMofo
  
  describe Game do 

    it "should belong to a Match" do
      subject.match.should be_true
    end
          
    it "should have a Boneyard'" do
      subject.boneyard.should be_true
    end
    
    it "should have a Board" do
      subject.board.should be_true
    end

    it "should have a Queue" do
      subject.queue.should be_true
    end

    describe "#players" do

      it "should have a group of Players" do
        subject.players.should be_instance_of(PlayerGroup)
      end
      
      it "should have same player group as the Match it belongs to" do
        subject.players.should equal(subject.match.players)
      end
    end
          
    describe "#the deal" do
      
      it "should deal 7 dominos to each player" do
        subject.players.each{ |player| player.hand.should have(7).dominos }
      end
      
      context "in match with 4 players" do
        
        it "should have an empty boneyard after the deal" do
          subject.boneyard.should have(0).bones
        end
      end
      
      context "in match with 2 players" do
        subject = Game.new(Match.new(2,5))
        
        it "should have 14 remaining bones in the boneyard after the deal" do
          subject.boneyard.should have(14).bones          
        end
      end    
    end
  end
end