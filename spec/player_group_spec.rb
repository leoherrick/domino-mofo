require "spec_helper"

module DominoMofo
  
  describe PlayerGroup do
    before(:each) do
      @player_group = PlayerGroup.new
    end
    
    it "should return player with given domino" do
      game = double('game')
      player1 = Player.new(game)
      player2 = Player.new(game)
      player1.hand << Domino.new(2,3) << Domino.new(4,3)
      player2.hand << Double.new(2,2) << Double.new(1,1)
      @player_group << player1 << player2
    
      @player_group.find_player_with_domino(2,3).should === player1
      @player_group.find_player_with_domino(3,2).should === player1
      @player_group.find_player_with_domino(1,1).should === player2
    end
        
  end
end
