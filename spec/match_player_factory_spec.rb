require "spec_helper"

module DominoMofo
  describe MatchPlayerFactory do
    
    before(:each) do
      @match = double("match")
      
      @match.stub(:number_of_players).and_return(4)
      @subject = MatchPlayerFactory.new(@match)
    end

    it "should belong to a match" do
      @subject.match.should equal(@match)
    end
    
    it "should create a group of players for a match" do
      @subject.create_player_group.should be_kind_of(PlayerGroup)
    end
    
    it "should add one human player to the match" do
      @subject.create_player_group.find_all{|p| p.human_player?}.should have(1).human_player
    end
    
    describe "should add computer players to match" do 
      
      context "by default" do
        it "should have 3 computer players" do
          @match.stub(:number_of_players).and_return(4)
          @subject = MatchPlayerFactory.new(@match)
          @subject.create_player_group.find_all{|p| p.computer_player?}.should have(3).computer_players
        end
      end
      
      context "when in a 3 player match" do
        it "should have 2 computer players" do
          @match.stub(:number_of_players).and_return(3)
          @subject = MatchPlayerFactory.new(@match)
          @subject.create_player_group.find_all{|p| p.computer_player?}.should have(2).computer_players
        end
      end
    end
        
  end  
end