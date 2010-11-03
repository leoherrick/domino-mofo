require "spec_helper"

module DominoMofo
  
  describe Game do 
    before(:each) do
      @game = Game.new(Match.new)
    end


    it "should belong to a Match" do
      @game.match.should be_true
    end
          
    it "should have a Boneyard'" do
      @game.boneyard.should be_true
    end
    
    it "should have a Board" do
      @game.board.should be_true
    end
    
    describe "#booleans" do
      it "should know if it's the first game of the match" do
        match = double("match")
        match.stub(:players).and_return(PlayerGroup.new)
        match.stub(:dom).and_return(nil)
        @game = Game.new(match)
        @game.should be_first_game
      end
    end

    describe "#players" do

      it "should have a group of Players" do
        @game.players.should be_instance_of(PlayerGroup)
      end
      
      it "should have same player group as the Match it belongs to" do
        @game.players.should equal(@game.match.players)
      end
    end
          
    describe "#the deal" do
      
      it "should deal 7 dominos to each player" do
        @game.players.each{ |player| player.hand.should have(7).dominos }
      end
      
      context "in match with 4 players" do
        
        it "should have an empty boneyard after the deal" do
          @game.boneyard.should have(0).bones
        end
      end
      
      context "in match with 2 players" do
        before(:each) do
          @game = Game.new(Match.new(2,5))
        end
        
        it "should have 14 remaining bones in the boneyard after the deal" do
          @game.boneyard.should have(14).bones          
        end
      end    
    end
  end
end