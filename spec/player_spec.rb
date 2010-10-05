require "spec_helper"

module DominoMofo
  
  describe Player do 
    before(:each) do
      @player = Player.new
    end

    it "should have a hand of dominoes" do
      @player.hand.should be_true
    end      
    
    it "should be able to join game" do
      expect {
        @player.join_game(Game.new({:players => 4}))
      }.to change{
        @player.game.class
      }.from(false).to(Game)
    end
    
    it "should know if it's human" do
      human_player = HumanPlayer.new #subclass of Player
      human_player.is_human?.should be_true
    end

    it "should know if it's a computer controlled player" do
      computer_player = ComputerPlayer.new #subclass of Player
      computer_player.is_computer_player?.should be_true
    end
    
    it "should be able to lead with given domino" do
      @player.join_game(Game.new({:players => 4}))
      hand = @player.hand << Domino.new(6,6)
      line = double('line').stub(:place_lead).and_return(true)
      expect {
        @player.lead_with_domino(6,6)
      }.to change {
        @player.hand.length
      }.from(1).to(0)
    end
        
  end
end
