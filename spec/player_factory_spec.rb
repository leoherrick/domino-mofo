require "spec_helper"

module DominoMofo
  describe PlayerFactory do
    
    let(:game) { double('game') }
    let(:player_factory) { PlayerFactory.new(game) }
    
    context "in games with 2 players" do
      before(:each) do
        game.stub(:number_of_players).and_return(2)
      end

      it "should create player group w/ 2 players" do
        player_factory.create_players.should have(2).players
      end
    
      it "1 of which is human" do
        human_players = player_factory.create_players.find_all {|player| player.class == HumanPlayer}
        human_players.should have_exactly(1).human_player
      end
    
      it "1 of which is a computer player" do 
        computer_players = player_factory.create_players.find_all {|player| player.class == ComputerPlayer}
        computer_players.should have_exactly(1).computer_players
      end
    end

    context "in games with 4 players" do
      before(:each) do
        game.stub(:number_of_players).and_return(4)
      end

      it "should create player group w/ 4 players" do
        player_factory.create_players.should have(4).players
      end
    
      it "1 of which is human" do
        human_players = player_factory.create_players.find_all {|player| player.class == HumanPlayer}
        human_players.should have_exactly(1).human_player
      end
    
      it "3 of which is a computer player" do 
        computer_players = player_factory.create_players.find_all {|player| player.class == ComputerPlayer}
        computer_players.should have_exactly(3).computer_players
      end
    end
    
    context "in all cases" do
      before(:each) do
        game.stub(:number_of_players).and_return(4)
      end
    
      it "should add game object to each player" do
        player_factory.create_players.each do |player|
          player.game.should be_true
        end
      end
    end
  end
end