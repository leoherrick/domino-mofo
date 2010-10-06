require "spec_helper"

module DominoMofo
  
  describe Game do 
    before(:each) do
      @game = Game.new
    end
  
    it "should have 1 human player" do
      @game.players.find_all { |p| p.class == HumanPlayer }.should have(1).human_player
    end
        
    it "should have a 'Boneyard'" do
      @game.boneyard.should be_true
    end
    
    it "should have a board" do
      @game.board.should be_true
    end

    describe "#the queue" do
      it "should have 4 players" do
        @game.queue.should have(4).players
      end
      
      it "should have the human first" do
        @game.queue[0].should be_a_human_player
      end
    end  
      
    describe "#the deal" do
      it "should deal 7 dominos to each player" do
        @game.players.each{ |player| player.hand.should have(7).dominos }
      end
    end
  
    context "by default" do      
      it "should have 4 players" do
        @game.players.should have(4).players
      end
      
      it "should have 3 computer players" do
        @game.players.find_all { |p| p.class == ComputerPlayer }.should have(3).computer_players
      end
      
      it "should have an empty boneyard" do
        @game.boneyard.should have(0).dominoes
      end
    end
    
    context "#with custom number of players" do
      before(:each) do
        @game_with_2 = Game.new(2) 
        @game_with_3 = Game.new(3) 
        @both_games = [@game_with_2, @game_with_3]
      end

      it "should create game with only a given number of players" do 
        @game_with_2.players.should have(2).players
        @game_with_3.players.should have(3).players
      end
      
      it "should have a boneyard with 7 - 14 dominoes" do
        @game_with_2.boneyard.should have(14).dominoes
        @game_with_3.boneyard.should have(7).dominoes
      end      
    end
  end
end