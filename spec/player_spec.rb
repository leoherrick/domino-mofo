require "spec_helper"

module DominoMofo
  
  describe Player do 
    before(:each) do
      @game = Game.new
      @player = Player.new(@game)
    end

    it "should have a hand of dominoes" do
      @player.hand.should be_true
    end      
    
    it "should belong to a game" do
        @player.game.should be_true
    end
    
    it "should know if it's human" do
      HumanPlayer.new(@game).should be_human_player
    end

    it "should know if it's a computer controlled player" do
      ComputerPlayer.new(@game).should be_computer_player
    end
        
  end
end
