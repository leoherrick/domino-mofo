require "spec_helper"

module DominoMofo
  describe MatchPlayerFactory do
    
    before(:each) do
      @match = double("match")
      game = double("game")
      
      @match.stub(:number_of_players).and_return(4)
      @match.stub(:active_game).and_return(game)
      @match.stub(:players=)
    end

    it "should belong to a match" do
      @match_player_factory = MatchPlayerFactory.new(@match)
      @match_player_factory.match.should be_true
    end

    it "should add a group of players to a match" do
      @match.should_receive(:players=).with(instance_of(PlayerGroup))
      @match_player_factory = MatchPlayerFactory.new(@match)
    end
    
    it "should add one human player to the match" do
      @match.should_receive(:players=).with(one_human_player)
      @match_player_factory = MatchPlayerFactory.new(@match)
    end
    
    describe "should add computer players to match" do 
      
      context "by default" do
        it "should have 3 computer players" do
          @match.should_receive(:players=).with(number_of_computer_players(3))
          @match_player_factory = MatchPlayerFactory.new(@match)        
        end
      end
      
      context "in a three player match" do
        it "should have 2 computer players" do
          @match.stub(:number_of_players).and_return(3)
          @match.should_receive(:players=).with(number_of_computer_players(2))
          @match_player_factory = MatchPlayerFactory.new(@match)
        end
      end
    end
        
  end  
end