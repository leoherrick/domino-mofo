require "spec_helper"

module DominoMofo
  
  describe Player do 
    before(:each) do
      @game = double('game')
      @player = Player.new(@game)
    end

    it "should have a hand of dominoes" do
      @player.hand.should be_true
    end      
    
    it "should belong to a game" do
        @player.game.should be_true
    end
    
    it "should know if it's human" do
      human_player = HumanPlayer.new(@game) #subclass of Player
      human_player.human_player?.should be_true
    end

    it "should know if it's a computer controlled player" do
      computer_player = ComputerPlayer.new(@game) #subclass of Player
      computer_player.computer_player?.should be_true
    end
    
    it "should be able to lead with given domino" do
      @game = Game.new
      @player = Player.new(@game)
      hand = @player.hand << Domino.new(6,6)

      expect {
        @player.lead_with_domino(6,6)
      }.to change {
        @player.hand.length
      }.from(1).to(0)
    end
        
  end
end
