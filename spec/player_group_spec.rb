require "spec_helper"

module DominoMofo
  
  describe PlayerGroup do
    before(:each) do
      player_factory = PlayerFactory.new
      @player_group = player_factory.create_player_group(4)
    end

    it "should have one human player" do
      @player_group.human_player.should be_true
    end
    
    it "should return player with given domino" do
      game = Game.new({:players => 4})
      player_group = game.players
      player_with_2_3 = player_group.find_player_with_domino(2,3)
      player_with_2_3.hand.has_domino?(3,2).should be_true
    end
        
  end
end
