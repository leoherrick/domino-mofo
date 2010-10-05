require "spec_helper"

module DominoMofo
  
  describe Game do 
            
    before(:each) do
      @game_with_2 = Game.new({:players => 2}) 
      @game_with_3 = Game.new({:players => 3}) 
      @game_with_4 = Game.new({:players => 4})
      @all_three_games = [@game_with_2, @game_with_3, @game_with_4]
    end

    it "should create a player group of given number of players" do 
      @game_with_2.players.should have(2).players
      @game_with_3.players.should have(3).players
      @game_with_4.players.should have(4).players
      @all_three_games.each {|game| game.players.class.should equal(PlayerGroup)}
    end
    
    it "should have exactly one human player" do
      @all_three_games.each do |game|
        players = game.players
        players.find_all { |p| p.class == HumanPlayer }.should have_exactly(1).human_player
      end
    end
  
    it "should have a 'Boneyard'" do
      @all_three_games.each {|game| game.boneyard.should be_true }
    end
    
    describe "#the deal" do

      it "should deal 7 dominos to each player" do
        @game_with_2.players.each{ |player| player.hand.should have(7).dominos }
      end
    
      it "should subtract dominoes from the boneyard after dealing" do
        @game_with_2.boneyard.should have(14).dominoes
        @game_with_3.boneyard.should have(7).dominoes
        @game_with_4.boneyard.should have(0).dominoes
      end
    end    
  end
end