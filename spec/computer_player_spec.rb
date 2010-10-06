require "spec_helper"

module DominoMofo
  describe ComputerPlayer do

    before(:each) do
      board = double('board')
      game = double('game')
      game.stub(:board).and_return(board)
      @computer_player = ComputerPlayer.new(game)
    end
    
    it "should be a computer" do
      @computer_player.computer_player?.should be_true
    end
    
    it "should have a hand" do
      @computer_player.hand.should be_true
    end
    
    it "has an AI module for deciding what domino to play" do
      @computer_player.ai.should be_true
    end
    
    it "should play" do
      @computer_player.play.should be_true
    end
    
  end
end