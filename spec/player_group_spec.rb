require "spec_helper"

module DominoMofo
  
  describe PlayerGroup do
    before(:each) do
      match = Match.new
      @player1 = HumanPlayer.new(match)
      @player2 = Player.new(match)  
      @player1.hand << Domino.new(2,3) << Domino.new(4,3)
      @player2.hand << Double.new(2) << Double.new(1)
      subject << @player1 << @player2
    end
        
    it "should return a player with a given domino" do
      subject.find_player_with_domino(2,3).should equal(@player1)
      subject.find_player_with_domino(3,2).should equal(@player1)
      subject.find_player_with_domino(1,1).should equal(@player2)
    end
    
    it "should return the player with the highest pair" do
      subject.find_player_with_highest_pair.should equal(@player2)
    end
  end
end
